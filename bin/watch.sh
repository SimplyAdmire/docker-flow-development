#!/usr/bin/env bash
fswatch -0 -r -e '.git' -e "app/Data/" -e ".*___$" app | (while read -d "" event; do ./bin/sync.sh ${event}; done)
