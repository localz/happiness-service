FROM node:8.2-alpine

MAINTAINER Localz

RUN apk update \
   && apk add tini bash

##NPM global packages
RUN npm install -gq nodemon

# Provides cached layer for node_modules
ADD package.json /tmp/package.json
RUN cd /tmp && npm install -q

#Code base
ADD ./ /src
RUN rm -rf /src/node_modules && cp -a /tmp/node_modules /src/

EXPOSE 8000

# Define working directory
WORKDIR /src

ENTRYPOINT ["tini", "--"]

CMD [ "node", "app/server.js"]


