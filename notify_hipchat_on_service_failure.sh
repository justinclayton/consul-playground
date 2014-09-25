#!/bin/bash

set -e

[[ -z $HIPCHAT_TOKEN ]] && echo 'err: you must first set $HIPCHAT_TOKEN'

export HIPCHAT_ROOM_ID="184447"
export HIPCHAT_COLOR="purple"
export HIPCHAT_FROM="HAM"

export HIPCHAT_MESSAGE=$(cat)

echo $HIPCHAT_MESSAGE | bash hipchat_room_message -n -m text