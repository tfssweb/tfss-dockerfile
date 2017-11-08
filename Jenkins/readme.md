docker run --name jenkins \
    -d \
    -p 8080:8080 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    jenkins-docker
