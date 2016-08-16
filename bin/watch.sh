#!/usr/bin/env bash
./Environment/bin/docker-compose.sh exec rsync chown 1000:33 /var/www/

fswatch -0 -r -e '.git' -e "app/Data/" -e ".*___$" app | (while read -d "" event; do ./bin/sync.sh ${event}; done)
