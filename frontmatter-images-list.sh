#!/bin/sh

for arg in $@; do
    echo "Updating: $arg"
    yq -i -f "process" ".images = [.images[].src]" $arg
done
