#!/usr/bin/env bash
source ./Environment/bin/load-env.sh

rsync -rlptv --exclude="Data/" --exclude=".git" --delete app/* rsync://127.0.0.1:8${PORTSUFFIX}/volume
