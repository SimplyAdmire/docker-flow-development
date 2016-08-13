#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

"${DIR}/stop-environment.sh"
"${DIR}/start-environment.sh"
