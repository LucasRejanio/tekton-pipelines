## Create a docker file
FROM alpine

RUN apk update \
    && apk add --no-cache aws-cli \
    && apk add --no-cache docker
