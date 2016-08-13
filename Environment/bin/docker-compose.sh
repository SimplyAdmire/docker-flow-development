#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${DIR}/load-env.sh"

composeFile="Environment/docker-compose.yml"
if [ -f $1 ]; then
    composeFile="${1}"
    shift
fi
overrideComposeFile="${composeFile/.yml/.override.yml}"

ROOTDIR="$(cd $DIR && cd ../../ && pwd)"
dockerComposeCommand="docker-compose -f $ROOTDIR/$composeFile"

if [ -f $overrideComposeFile ]; then
    dockerComposeCommand+=" -f $overrideComposeFile"
fi

if [ -f "$ROOTDIR/app/Build/$composeFile" ]; then
    dockerComposeCommand+=" -f $ROOTDIR/app/Build/$composeFile"
fi

if [ -f "$ROOTDIR/app/Build/$overrideComposeFile" ]; then
    dockerComposeCommand+=" -f $ROOTDIR/app/Build/$overrideComposeFile"
fi

${dockerComposeCommand} $@
