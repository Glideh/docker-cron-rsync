# Docker cron rsync

## Usage

Example with a `docker-compose.yml`:

```yml
version: "3"

services:
  rsync:
    image: glide/cron-rsync:0.1
    volumes:
      - ~/.ssh:/host-ssh:ro
      - ./backup:/backup
    environment:
      RSYNC_CRONTAB: "* * * * *"
      RSYNC_OPTIONS: "-tv toto@example.com:backup/*.tgz /backup"
```

Here we want to synchronize (download new files) from a remote server with rsync by SSH every minute.

Every minute this will be executed:

```bash
rsync -tv toto@example.com:backup/*.tgz /backup
```
