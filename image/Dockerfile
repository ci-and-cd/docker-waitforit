
FROM cirepo/nix:2.0.4_alpine-3.7


ARG IMAGE_ARG_FILESERVER
ARG IMAGE_ARG_WAITFORIT_VERSION


COPY --chown=alpine:alpine docker /data


RUN set -ex \
    && echo ===== Install waitforit ===== \
    && if [ ! -f /data/waitforit ]; then ${ARIA2C_DOWNLOAD} -d /data -o "waitforit" "${IMAGE_ARG_FILESERVER:-https://github.com}/maxcnunes/waitforit/releases/download/v${IMAGE_ARG_WAITFORIT_VERSION:-2.2.0}/waitforit-linux_amd64"; fi \
    && sudo mv /data/waitforit /usr/bin/waitforit \
    && sudo chown root:root /usr/bin/waitforit \
    && sudo chmod 755 /usr/bin/waitforit
