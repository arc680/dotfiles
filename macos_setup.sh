#!/bin/bash

# install command-line-tools
if [[ ! -d /Library/Developer/CommandLineTools ]]; then
    echo "Installing command-line-tools"
    xcode-select --install
fi

# install Homebrew
if test ! $(which brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap homebrew/bundle
    brew tap caskroom/cask
fi

# ln -s ${DOTDIR}/pkg/vsc-settings.json ~/Library/Application\ Support/Code/User/settings.json