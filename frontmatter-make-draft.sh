#!/bin/sh

for arg in $@; do
    echo "Setting as DRAFT: $arg"
    yq -i -f "process" ".draft = true" $arg
done
