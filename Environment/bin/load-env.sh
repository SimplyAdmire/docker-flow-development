#!/usr/bin/env bash
ENVDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

set -o allexport
source "$ENVDIR/.env"

if [ -f "$ENVDIR/../app/Build/Environment/.env" ]; then
    source "$ENVDIR/../app/Build/Environment/.env"
fi

if [ -f "$ENVDIR/../app/Build/Environment/.env.local" ]; then
    source "$ENVDIR/../app/Build/Environment/.env.local"
fi

set +o allexport
