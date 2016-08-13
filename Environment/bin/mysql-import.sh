#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${DIR}/load-env.sh"

docker exec -i $("$DIR/docker-compose.sh" ps | grep db | awk '{print $1}') mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE
