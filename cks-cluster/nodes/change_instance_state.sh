#!/bin/bash

STATUS=$1
RUNNING="RUNNING"
TERMINATED="TERMINATED"
if [[ $STATUS == "start" ]]; then
    OLD_STATE=$TERMINATED
    NEW_STATE=$RUNNING
else
    OLD_STATE=$RUNNING
    NEW_STATE=$TERMINATED
fi

fd "node" | while read -r INPUT; do sed -i "s/$OLD_STATE/$NEW_STATE/" "$INPUT"; done   
terraform apply
