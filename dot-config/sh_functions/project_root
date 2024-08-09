#!/bin/bash

dir_path="$(realpath "${1:-.}")"
while ! [[ -e "$dir_path/.git" ]]; do
    if [ "$dir_path" = '/' ] || [ "$dir_path" = "" ]; then
        return 1
    fi
    dir_path="$(dirname "$dir_path")"
done
echo "$dir_path"

