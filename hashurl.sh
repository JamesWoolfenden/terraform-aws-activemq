#!/usr/bin/env bash
# gets hashurl of tag


function get-moduleversion() {
 IFS='/' read -r name provider module <<<"$1"
 url="https://github.com/${name}/terraform-${provider}-${module}"
 git -c 'versionsort.suffix=-' \
    ls-remote --exit-code --refs --sort='version:refname' --tags "$url" '*.*.*' \
    | tail --lines=1 \
    | cut --delimiter='/' --fields=3
}

function get-moduleinfo() {
  IFS='/' read -r name module provider<<<"$1"
  url="https://github.com/${name}/terraform-${provider}-${module}"
  #echo $url
  results=$(git -c 'versionsort.suffix=-' \
    ls-remote --exit-code --refs --sort='version:refname' --tags "$url" '*.*.*' \
    | tail --lines=1 )
  echo "$results"
}

# shellcheck disable=SC2034
function split() {
  IFS=" " read -r hash version <<<"$1"
  echo "$hash"
}

function get-modulehash() {
  local temp
  temp=$(get-moduleinfo "$1")
  split "$temp"
}

function get-url() {
  hash=$(get-modulehash "$1")
  IFS='/' read -r name provider module <<<"$1"
  url="git::https://github.com/${name}/terraform-${provider}-${module}.git?ref=${hash}"
  echo "$url"
}

# get-moduleversion $1
# get-moduleinfo $1
# get-modulehash $1
get-url "$1"
