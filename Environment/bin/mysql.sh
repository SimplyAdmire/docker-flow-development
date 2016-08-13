#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${DIR}/load-env.sh"

"${DIR}/docker-compose.sh" exec db mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE $@
