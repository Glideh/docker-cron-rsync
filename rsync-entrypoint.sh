#!/bin/sh

set -e

# Grants host ssh config to root
mkdir -p ~/.ssh
cp -r /host-ssh/* ~/.ssh/
chown -R $(id -u):$(id -g) ~/.ssh

# Creates the cron script
cat << EOF > /run-rsync.sh
set -e
rsync ${RSYNC_OPTIONS}
EOF
chmod +x /run-rsync.sh

# Setup the crontab entry
export CRONTAB_ENTRY="${RSYNC_CRONTAB} sh /run-rsync.sh > /dev/stdout"
