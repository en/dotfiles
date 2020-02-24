#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [[ ! -e ~/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

if [[ ! -e ~/.config/awesome ]]; then
    git clone --recursive https://github.com/lcpz/awesome-copycats.git
    mkdir -p ~/.config/awesome
    mv -bv awesome-copycats/* ~/.config/awesome && rm -rf awesome-copycats
    cp ~/.config/awesome/rc.lua.template ~/.config/awesome/rc.lua
fi

if [[ ! -e ~/.emacs.d ]]; then
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

for f in $(find ./HOME -type f); do
    src="$(realpath $f)"
    dst="${f/.\/HOME/$HOME}"
    if [[ -e "$dst" ]]; then
        if [[ -h "$dst" ]]; then
            if [[ "$(readlink -n $dst)" == "$src" ]]; then
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
    ln -sf "$src" "$dst"
    echo "make a symlink: $dst -> $src"
done


