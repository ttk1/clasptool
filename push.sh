#!/bin/bash -eu

RUNNING_MODE=$1
cd $(dirname $0)

if [[ $RUNNING_MODE = dev ]]; then
    SCRIPT_ID="xxx_dev_script_id_xxx"
elif [[ $RUNNING_MODE = stg ]]; then
    SCRIPT_ID="xxx_stg_script_id_xxx"
elif [[ $RUNNING_MODE = prd ]]; then
    SCRIPT_ID="xxx_prd_script_id_xxx"
else
    echo 'usage: ./push.sh <dev|stg|prd>'
    exit 1
fi

echo '{"scriptId":"'$SCRIPT_ID'"}' > .clasp.json
echo 'var RUNNING_MODE = '\'$RUNNING_MODE\'\; > RUNNING_MODE.js
clasp push