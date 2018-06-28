
FROM alpine:3.7

MAINTAINER haolun


ARG IMAGE_ARG_ALPINE_MIRROR
ARG IMAGE_ARG_FILESERVER
ARG IMAGE_ARG_WAITFORIT_VERSION


ENV ARIA2C_DOWNLOAD aria2c --file-allocation=none -c -x 10 -s 10 -m 0 --console-log-level=notice --log-level=notice --summary-interval=0


RUN set -ex \
    && echo ===== Install tools ===== \
    && touch /etc/apk/repositories \
    && echo "https://${IMAGE_ARG_ALPINE_MIRROR:-dl-3.alpinelinux.org}/alpine/v3.7/main" > /etc/apk/repositories \
    && echo "https://${IMAGE_ARG_ALPINE_MIRROR:-dl-3.alpinelinux.org}/alpine/v3.7/community" >> /etc/apk/repositories \
    && echo "https://${IMAGE_ARG_ALPINE_MIRROR:-dl-3.alpinelinux.org}/alpine/edge/testing/" >> /etc/apk/repositories \
    && apk add --update aria2 \
    && echo ===== Install waitforit ===== \
    && ${ARIA2C_DOWNLOAD} -d /usr/bin -o "waitforit" "${IMAGE_ARG_FILESERVER:-https://github.com}/maxcnunes/waitforit/releases/download/v${IMAGE_ARG_WAITFORIT_VERSION:-2.2.0}/waitforit-linux_amd64" \
    && chmod 755 /usr/bin/waitforit \
    && rm -rf /tmp/* /var/cache/apk/*
