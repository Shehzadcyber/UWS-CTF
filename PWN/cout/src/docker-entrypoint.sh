#!/bin/bash

FLAG_FMT="UWS"
exec 3<>/dev/tcp/172.17.0.1/9512
echo -en "GET /flag?chal_id=$CHALLENGE_ID&team_id=$TEAM_ID HTTP/1.1\nHost: $FLAG_ENDPOINT_HOST\n\n\n" >&3
while IFS= read -r -u 3 line; do
    tmp=$(echo "$line" | grep -ioE "$FLAG_FMT{.*}")
    if [[ $? == 0 ]]; then
        flag=$(echo $tmp)
    fi
done
exec 3<&-
echo "$flag" > /app/flag.txt

exec "$@"
