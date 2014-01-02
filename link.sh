#!/bin/bash

# Links all files in this dir into your home dir, preserving originals if they were actual files

for file in .*; do
    if [ $file == ".git" ] || [ $file == "." ] || [ $file == ".." ]; then
        continue
    fi

    if [ -d "$file" ] && [ -d "$HOME/$file" ] || [ -e "$HOME/$file" ]; then
        echo "Moving original $HOME/$file to $HOME/$file.old"
        mv "$HOME/$file" "$HOME/$file.old"
    elif [ -h "$HOME/$file" ]; then
        echo "Removing original link $HOME/$file"
        rm "$HOME/$file"
    fi

    echo "Linking $file to $HOME/$file"
    ln -s "$PWD/$file" "$HOME/"
done
