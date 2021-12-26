#!/bin/bash

tail_file="$1"
url="$2"

tail --lines=0 -F "$tail_file" | while read LINE; do
  msg_no_ansi=$(echo $LINE | sed --expression="s/\"/'/g" |sed --unbuffered --expression='s/\x1b\[[0-9;]*m//g');
  echo "$LINE";
  curl -X POST \
       -H "Content-Type: application/json" \
       --data "{\"content\": \"$msg_no_ansi\"}" \
       "$url";
done
