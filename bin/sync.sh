#!/usr/bin/env bash
source ./Environment/bin/load-env.sh

file="${1/$(pwd)\/app\//}"

if [ -f $1 ]; then
    rsync --owner=1000 --group=33 -rlptq app/${file} rsync://127.0.0.1:8${PORTSUFFIX}/volume/${file}
    echo "$(date +%T) synced ${file}"
else
    directory=$(dirname $file)

    rsync --owner=1000 --group=33 -rlptq --delete-before app/$directory rsync://127.0.0.1:8${PORTSUFFIX}/volume/$(dirname $directory)

    echo "$(date +%T) synced ${directory} to remove ${file}"
fi
