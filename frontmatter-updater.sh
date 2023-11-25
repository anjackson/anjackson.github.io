#!/bin/sh

for arg in $@; do
    echo "Updating: $arg"
    yq -i -f "process" ".url = .permalink | del(.permalink)" $arg
    yq -i -f "process" ".aliases = .redirect_from | del(.redirect_from)" $arg
    yq -i -f "process" ".date = .created" $arg
done
