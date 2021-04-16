FROM alpine:3.13.4

ENV CRONTAB_ENTRY=""

RUN set -x; \
    apk add --no-cache --update rsync sudo openssh-client ca-certificates \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

COPY rsync-entrypoint.sh /entrypoint.d/rsync.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
CMD ["crond", "-f", "-l", "0"]
