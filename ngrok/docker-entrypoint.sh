#!/bin/bash
function StandardOutput {
    echo -e "\033[32m$1\033[0m"
}
function ErrorOutput {
    echo -e "\033[31m$1!!!\033[0m"
}
if [ ${NGROK_DOMAIN} == "**NULL**" ];then
    ErrorOutput "Please set the NGROK_DOMAIN environment variable !"
    exit 1
fi
if [ ! -e ${NGROK_CONFIG}/install.lock ];then
    StandardOutput "==> Production certificate"
    rm -rf /etc/ngrok/*
    mkdir -p /etc/ngrok/package/linux64 \
        /etc/ngrok/package/linux32 \
        /etc/ngrok/package/win64 \
        /etc/ngrok/package/win32 \
        /etc/ngrok/package/arm \
        /etc/ngrok/package/mac64 \
        /etc/ngrok/package/mac32 \
        ${NGROK_CONFIG}/tls
    cd ${NGROK_CONFIG}/tls
    openssl genrsa -out rootCA.key 2048 &> /dev/null
    openssl req -x509 -new -nodes -key rootCA.key -subj "/CN=$NGROK_DOMAIN" -days 5000 -out rootCA.pem &> /dev/null
    openssl genrsa -out device.key 2048 &> /dev/null
    openssl req -new -key device.key -subj "/CN=$NGROK_DOMAIN" -out device.csr &> /dev/null
    openssl x509 -req -in device.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out device.crt -days 5000 &> /dev/null
    cp -f rootCA.pem ${NGROK_HOME}/assets/client/tls/ngrokroot.crt
    mv rootCA.pem ngrokroot.crt
    cp -f device.crt ${NGROK_HOME}/assets/server/tls/snakeoil.crt
    mv device.crt snakeoil.crt
    cp -f device.key ${NGROK_HOME}/assets/server/tls/snakeoil.key
    mv device.key snakeoil.key
    cd ${NGROK_HOME}
    StandardOutput "==> Compile Ngrok Server..."
    GOOS=linux GOARCH=amd64 make release-server &> /dev/null
    StandardOutput "==> Compile Ngrok Client For Linux ..."
    GOOS=linux GOARCH=amd64 make release-client &> /dev/null
    GOOS=linux GOARCH=386 make release-client &> /dev/null
    GOOS=linux GOARCH=arm make release-client &> /dev/null
    StandardOutput "==> Compile Ngrok Client For Windows ..."
    GOOS=windows GOARCH=amd64 make release-client &> /dev/null
    GOOS=windows GOARCH=386 make release-client &> /dev/null
    StandardOutput "==> Compile Ngrok Client For Mac ..."
    GOOS=darwin GOARCH=386 make release-client &> /dev/null
    GOOS=darwin GOARCH=amd64 make release-client &> /dev/null
    if [ -e /var/run/docker.sock ];then
        NGROK_PORT=`docker inspect ngrok-server | jq .[0].NetworkSettings.Ports.\"4443/tcp\"[0].HostPort | sed "s/\"//g"`
        if [ ${NGROK_PORT} == 'null' ];then
            NGROK_PORT=4443
        fi
    else
        NGROK_PORT=4443
    fi

    cat > ngrok.yml << EOF
server_addr: "$NGROK_DOMAIN:${NGROK_PORT}"
trust_host_root_certs: false
auth_token: ${NGROK_USER}:${NGROK_PAAS}

tunnels:
    ssh:
        remote_port: 22
        proto:
            tcp: "127.0.0.1:22"
    http:
        subdomain: "www"
        proto:
            http: 80
    https:
        subdomain: dce
        proto:
            https: 172.20.5.100:80
    auth:
        auth: "admin:admin"
        subdomain: "www"
        proto:
            http: 8080
    domain:
        hostname: "www.example.com"
        proto:
            http: 192.168.1.100:80
    authdomain:
        auth: "admin:admin"
        hostname: "www.example.com"
        proto:
            http: 80
EOF
    cat > start.bat << EOF
@echo off
ipconfig /flushdns
ngrok.exe -config ngrok.cfg start ssh mstsc web
pause
EOF
    cat > start.sh << EOF
#!/bin/bash
if [ \$# -eq 0 ];then
    echo "Usage: \$0 configfile tunnelsname[,tunnelsname,tunnelsname]"
    echo "$0 ngrok.yml ssh"
    echo "$0 ngrok.yml ssh,http"
    exit 1
fi
./ngrok -config \$1 start \`echo \$2 | sed 's/,/ /g'\`
EOF
    chmod +x start.sh

    StandardOutput "==> Package required files"
    cp -p ./start.bat ./ngrok.yml bin/windows_amd64/ngrok.exe ${NGROK_CONFIG}/package/win64/
    cp -p ./start.bat ./ngrok.yml bin/windows_386/ngrok.exe ${NGROK_CONFIG}/package/win32/

    cp -p ./start.sh ./ngrok.yml bin/linux_arm/ngrok ${NGROK_CONFIG}/package/arm/

    cp -p ./start.sh ./ngrok.yml bin/darwin_amd64/ngrok   ${NGROK_CONFIG}/package/mac64/
    cp -p ./start.sh ./ngrok.yml bin/darwin_386/ngrok   ${NGROK_CONFIG}/package/mac32/

    cp ./start.sh ./ngrok.yml bin/ngrok ${NGROK_CONFIG}/package/linux64/
    cp ./start.sh ./ngrok.yml bin/linux_386/ngrok   ${NGROK_CONFIG}/package/linux32/

    cd ${NGROK_CONFIG}/package
    rm -rf *.zip
    for p in `ls`
    do
    	mv ${p} ngrok
    	zip ${p}.zip ngrok/* &> /dev/null
    	rm -rf ngrok
    done
    mv ${NGROK_HOME}/bin/ngrokd /etc/ngrok/ngrokd
    echo "${NGROK_USER} ${NGROK_PAAS}" > ${NGROK_CONFIG}/secret
    [ $? == 0 ] && touch ${NGROK_CONFIG}/install.lock || exit 1
fi

StandardOutput "==> Running ..."
StandardOutput "----------------------------------------"
StandardOutput "you can run command to see package dir"
StandardOutput "  docker inspect $HOSTNAME | jq '.[0].Mounts[0].Source'"
StandardOutput "----------------------------------------"
exec /etc/ngrok/ngrokd -secretPath ${NGROK_CONFIG}/secret -domain="$NGROK_DOMAIN" -tlsKey=${NGROK_CONFIG}/tls/snakeoil.key -tlsCrt=${NGROK_CONFIG}/tls/snakeoil.crt
