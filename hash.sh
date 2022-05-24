#!/usr/bin/env bash
# gets hash of tag
if [ $# -eq 0 ]
  then
    version=$(git describe --tags --abbrev=0)
else
    version=$1
fi

echo $(git show-ref --tag "$version") | tail -1| head -n1 | cut -d " " -f1

function get-moduleversion {
 IFS='/' read -r name provider module <<<"$1"
 url="https://github.com/${name}/terraform-${provider}-${module}"
 git -c 'versionsort.suffix=-' \
    ls-remote --exit-code --refs --sort='version:refname' --tags "$url" '*.*.*' \
    | tail --lines=1 \
    | cut --delimiter='/' --fields=3
}

function get-moduleinfo() {
  IFS='/' read -r name provider module <<<"$1"
  url="https://github.com/${name}/terraform-${provider}-${module}"
  #echo $url
  results=$(git -c 'versionsort.suffix=-' \
    ls-remote --exit-code --refs --sort='version:refname' --tags "$url" '*.*.*' \
    | tail --lines=1 )
  echo "$results"
}

function split() {
  IFS=" " read -r hash version <<<"$1"
  echo "$hash"
}

function get-modulehash() {
  local temp=$(get-moduleinfo "$1")
  echo $(split "$temp")
}

function get-url() {
  hash=$(get-modulehash "$1")
  IFS='/' read -r name provider module <<<"$1"
  url="git::https://github.com/${name}/terraform-${provider}-${module}.git?ref=${hash}"
  echo "$url"
}
