#!/bin/bash
# Run from root dir

for filepath in _members/*; do
    filename=$(basename $filepath)
    yamlpath=$(echo ".member_yaml/$filename.yaml")
    sed 's/---//' "$filepath" > "$yamlpath"
done