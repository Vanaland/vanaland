FROM node:12

ENV TIME_ZONE=Asia/Shanghai

RUN \
    mkdir -p /usr/src/app \
    && apt-get install tzdata \
    && echo "${TIME_ZONE}" > /etc/timezone \ 
    && ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime 

WORKDIR /usr/src/app

COPY dist/server/package.json /usr/src/app/server/package.json

RUN cd /usr/src/app/server && npm i

COPY dist /usr/src/app

EXPOSE 9358

CMD node server/server.bundle.js