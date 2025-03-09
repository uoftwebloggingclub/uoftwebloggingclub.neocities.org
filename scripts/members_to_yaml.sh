#!/bin/bash
# Run from root dir

if [ ! -d ".member_yaml" ]; then
    mkdir ".member_yaml"
fi

for filepath in _members/*; do
    filename=$(basename $filepath)
    yamlpath=$(echo ".member_yaml/$filename.yaml")
    if [ "$filename" != "example.md" ]; then
        sed 's/---//' "$filepath" > "$yamlpath"
    fi
done