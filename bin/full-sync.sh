#!/usr/bin/env bash
source ./Environment/bin/load-env.sh
./Environment/bin/docker-compose.sh exec rsync chown 1000:33 /var/www/

rsync -rlptv --exclude="Data/" --exclude=".git" --delete app/* rsync://127.0.0.1:8${PORTSUFFIX}/volume
