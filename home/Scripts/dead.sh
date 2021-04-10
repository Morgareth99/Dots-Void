#!/bin/bash

shopt -s dotglob

SYMLINKS_CHECK=("/home" "/opt")
THUMB_DIR="/homr/morgareth/.thumbnails/"
CACHE_DIR="/home/morgareth/.cache/"
BROWSER_DIR="/home/morgareth/.cache/moonchild\ productions/pale\ moon/"

dirs=( "$THUMB_DIR" "$CACHE_DIR" "$BROWSER_DIR" )

for dir in "${dirs[@]}"; do
   rm -rf "$dir"/*
done

mapfile -t broken_symlinks < <(find "${SYMLINKS_CHECK[@]}" -xtype l -print)
if [[ "${broken_symlinks[*]}" ]]; then
   rm "${broken_symlinks[@]}"
fi

if [ "$(vkpurge list | wc -l)" -eq 0 ]; then
   vkpurge rm all
fi

xbps-remove -Ooy
