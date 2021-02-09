#!/bin/bash

DOT=~/dotfiles; export DOT
DOT_GITHUB="git@github.com:arc680/dotfiles.git"; export DOT_GITHUB
ZPREZTO_GITHUB="https://github.com/sorin-ionescu/prezto.git"; export ZPREZTO_GITHUB
case "$(uname)" in
    "Darwin")
        DOT_FILES=(
        .gitconfig
        .gitconfig.local
        .vimrc
        .zpreztorc
        .zprofile
        .zshrc
        .zshrc.base
        .zshrc.macos
        ); export DOT_FILES;;
    "Linux")
        DOT_FILES=(
        .gitconfig
        .gitconfig.local
        .vimrc
        .zpreztorc
        .zprofile
        .zshrc
        .zshrc.base
        .zshrc.linux
        ); export DOT_FILES;;
    *)
        DOT_FILES=(
        .gitconfig
        .gitconfig.local
        .vimrc
        .zpreztorc
        .zprofile
        .zshrc
        .zshrc.base
        ); export DOT_FILES
esac

mkdir -p ~/.ssh ~/.vim/bundle

# install zprezto
git clone --recursive ${ZPREZTO_GITHUB} "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# install dotfiles
git clone ${DOT_GITHUB} ${DOT}
for file in ${DOT_FILES[@]}
do
    yes | ln -s ${DOT}/${file} ~/${file}
done

# neobundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

echo "Complete: please restart Terminal and continue manual settings"

