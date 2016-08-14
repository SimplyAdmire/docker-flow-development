#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${DIR}/load-env.sh"

"$DIR/docker-compose.sh" Environment/Build/docker-compose.yml run npm $@
