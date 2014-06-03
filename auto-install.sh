#!/bin/sh
VIMHOME=~/.vim

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$VIMHOME/vimrc" ] && die "$VIMHOME/vimrc already exists. Aborted."
[ -e "~/.vim" ] && die "~/.vim already exists. Aborted."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists. Aborted."

git clone git://github.com/starsirius/vimrc.git "$VIMHOME"
cd "$VIMHOME"
git submodule update --init

./install-vimrc.sh

cd bundle/command-t/ruby/command-t
(ruby extconf.rb && make) || warn "Can't compile Command-T."

echo "starsirius' vimrc is installed."
