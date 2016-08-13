#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOTDIR="$(cd $DIR && cd ../../ && pwd)"

source "${DIR}/load-env.sh"

dockerComposeCommand="docker-compose"

if ! [ -z $PROJECT_NAME ]; then
    dockerComposeCommand+=" -p $PROJECT_NAME"
fi

composeFile="Environment/docker-compose.yml"
if ! [ -z $1 ] && [ -f $1 ]; then
    composeFile="${1}"
    shift
fi

overrideComposeFile="${composeFile/.yml/.override.yml}"
dockerComposeCommand+=" -f $ROOTDIR/$composeFile"

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
