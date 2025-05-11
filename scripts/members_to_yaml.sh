#!/bin/bash
# Run from root dir

rm -rf .member_yaml
mkdir .member_yaml

for filepath in _members/*; do
    filename=$(basename $filepath)
    yamlpath=$(echo ".member_yaml/$filename.yaml")
    if [ "$filename" != "example.md" ]; then
        sed 's/---//' "$filepath" > "$yamlpath"
    fi
done