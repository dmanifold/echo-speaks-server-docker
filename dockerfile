FROM node:18-alpine

RUN apk add git

ENV useHeroku=false
ENV hubPlatform=Hubitat

WORKDIR /app

RUN npm install https://github.com/tonesto7/echo-speaks-server

WORKDIR /app/node_modules/echo-speaks-server
COPY ./ipEnv.patch .
RUN git apply ipEnv.patch

CMD node index.js
