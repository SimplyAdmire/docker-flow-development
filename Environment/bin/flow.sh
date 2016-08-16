#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${DIR}/load-env.sh"

"$DIR/docker-compose.sh" exec --user=1000:33 php php flow $@
