FROM node:10.10.0-alpine as build-stage

RUN npm config set registry https://registry.npm.taobao.org
WORKDIR /app
COPY package*.json ./

RUN npm install
COPY ./ .
#COPY ./index.js ./src/api/index.js
RUN npm run build

FROM nginx:1.15.3-alpine as production-stage
MAINTAINER tfss <1255791430@qq.com>
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY --from=build-stage /app/dist/ /usr/share/nginx/html/
