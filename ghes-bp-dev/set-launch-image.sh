#!/usr/bin/env bash

set -e

if [[ -z "$1" ]]; then
  echo 'Image not provided'
  exit 1
fi

# replace '/' with '\/'
replacement="${1//\//\\/}"

# remove leading 'launch='
if [[ "$replacement" == launch=* ]]; then
  replacement="${replacement:7}"
fi

cd ~/enterprise2
sed docker-image-list-ghe --in-place --regexp-extended --expression="s/^launch=.+/launch=$replacement/g" docker-image-list-ghe
echo 'UPDATED LINE:'
cat docker-image-list-ghe | grep launch
