
FROM cirepo/nix:2.0.4_alpine-3.7

MAINTAINER haolun


ARG IMAGE_ARG_FILESERVER
ARG IMAGE_ARG_WAITFORIT_VERSION


RUN set -ex \
    && echo ===== Install waitforit ===== \
    && sudo ${ARIA2C_DOWNLOAD} -d /usr/bin -o "waitforit" "${IMAGE_ARG_FILESERVER:-https://github.com}/maxcnunes/waitforit/releases/download/v${IMAGE_ARG_WAITFORIT_VERSION:-2.2.0}/waitforit-linux_amd64" \
    && sudo chmod 755 /usr/bin/waitforit
