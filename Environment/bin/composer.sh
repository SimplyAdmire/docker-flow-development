#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
"${DIR}/docker-compose.sh" Environment/Build/docker-compose.yml run --rm composer $@
