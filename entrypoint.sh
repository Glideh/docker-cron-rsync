#!/bin/sh

if test -f /entrypoint.d/*; then
    . /entrypoint.d/*
fi

cat << EOF > /var/spool/cron/crontabs/root
${CRONTAB_ENTRY}
EOF

exec "$@"
