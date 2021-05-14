#!/usr/bin/env bash

declare -A URLS

URLS=(
  ["g"]="https://www.google.com/search?q="
  ["gh"]="https://github.com/search?q="
  ["gr"]="https://www.goodreads.com/search?q="
  ["yt"]="https://www.youtube.com/results?search_query="
  ["aur"]="https://aur.archlinux.org/packages/?K="
)

declare -A ICONS

ICONS=(
    ["g"]=""
    ["gh"]=""
    ["gr"]=""
    ["yt"]=""
    ["aur"]=""
)

gen_list() {
    for i in "${!URLS[@]}"
    do
      echo ${ICONS[$i]} "$i"
    done
}

if [[ -z "$1" ]]; then
  gen_list
else
  platform=$( echo "$1" | awk '{$1=""; print $0}' | xargs | cut -d " " -f1)
  query=$( echo "$1" | awk '{$1="";$2=""; print $0}' | xargs )
  if [[ -n "$platform" ]] && [[ -n "$query" ]]; then
    url=${URLS["$platform"]}"$query"
    coproc (gio open "$url" & >& /dev/null &)
    exit
  else
    exit
  fi
fi
