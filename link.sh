#!/bin/bash

# make our target directories
for dir in $(find . -type d -not -path "./.git*" -not -path "."); do
    # rename existing symlink targets so we can make our own
    if [ -h "$HOME/$dir" ]; then
        echo "Removing existing link $HOME/$dir"
        rm "$HOME/$dir"
    fi

    mkdir -p "$HOME/$dir"
done

# link our files to the target directories
for file in $(find . -type f -not -path "./.git/*" -not -path "./README.md" -not -path "./link.sh"); do
    if [ -f "$HOME/$file" ] && [ ! -h "$HOME/$file" ]; then
        echo "Backing up $HOME/$file -> $HOME/$file.orig"
        mv "$HOME/$file" "$HOME/$file.orig"
    fi

    echo "Linking: $PWD/$file -> $HOME/$file"
    ln -sf "$PWD/$file" "$HOME/$file"
done