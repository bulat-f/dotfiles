#!/bin/bash

host="$1"

if [ -z "$host" ]
then
    echo "Usage: $0 HOST"
    exit 1
fi

tmprepo="/tmp/dotfiles_install.tmp.$RANDOM"

if [ -e $tmprepo ]
then
    rm -rf $tmprepo
fi

mkdir $tmprepo
pushd $tmprepo || exit 1
git clone git://github.com/bulat-f/dotfiles.git
tar czf dotfiles.tar.gz dotfiles
scp dotfiles.tar.gz "$host:dotfiles.tar.gz"
ssh "$host" tar xf dotfiles.tar.gz
ssh "$host" perl dotfiles/install.pl
popd || exit 1
rm -Rf $tmprepo

