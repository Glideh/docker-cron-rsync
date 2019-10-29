FROM dkruger/cron:latest

RUN set -x; \
    apk add --no-cache --update rsync sudo openssh-client ca-certificates \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

COPY rsync-entrypoint.sh /entrypoint.d/rsync.sh
