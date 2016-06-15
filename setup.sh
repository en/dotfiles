#!/usr/bin/env bash

for f in $(find ./HOME -type f); do
    src="$(realpath $f)"
    dst="${f/.\/HOME/$HOME}"
    if [[ -e "$dst" ]]; then
        if [[ -h "$dst" ]]; then
            if [[ "$(readlink -m $dst)" == "$src" ]]; then
                continue
            else
                rm "$dst"
            fi
        elif [[ -f "$dst" ]]; then
            if cmp --silent "$dst" "$src"; then
                rm "$dst"
            else
                mv "$dst" "${dst}.bak"
            fi
        else
            echo "ignore $dst (not sure what type it is)"
            continue
        fi
    fi
    dst_dir=$(dirname "$dst")
    if [[ ! -d "$dst_dir" ]]; then
        mkdir -p "$dst_dir"
    fi
    ln -s "$src" "$dst"
    echo "make a symlink: $dst -> $src"
done
