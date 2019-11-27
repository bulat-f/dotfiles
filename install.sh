#!/bin/bash

tmprepo="/tmp/dotfiles_install.tmp.$RANDOM"

if [ -e $tmprepo ]
then
    rm -rf $tmprepo
fi

mkdir $tmprepo
pushd $tmprepo || exit 1
git clone https://github.com/bulat-f/dotfiles.git
perl dotfiles/install.pl
popd || exit 1
rm -Rf $tmprepo

