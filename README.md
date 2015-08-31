# Ensure

A simple utilty to install things on your mac.

## Example

This is a part of my personal manifest (`~/.ensure/manifest`):

``` sh
ensure brew
ensure cask

ensure package macvim -- --with-override-system-vim
ensure package screen
ensure package git
ensure package hub
ensure package ack
ensure package bash
ensure package bash-completion
ensure package homebrew/dupes/grep -- --with-default-names

ensure package libxslt --link
ensure package libxml2 --link
ensure package readline --link
ensure package gnu-getopt --link
ensure package openssl --link
ensure package icu4c --link
ensure package libsodium

ensure package postgresql --service
ensure package memcached --service
ensure package redis --service
ensure tap homebrew/head-only
ensure package disque --service -- --HEAD

ensure package chruby
ensure package ruby-install
ensure ruby "2.2.2"

ensure package node
ensure npm bower

ensure app charles
ensure app dropbox
ensure app duet
ensure app gifrocket
ensure app google-chrome --copy
ensure app iterm2
ensure app limechat
ensure app minecraft
ensure app sketch
ensure app skype
ensure app slack
ensure app spectacle
ensure app steam
ensure app virtualbox
ensure app vlc

ensure vim-pathogen

ensure vim-plugin mileszs/ack.vim
ensure vim-plugin tpope/vim-commentary
ensure vim-plugin tpope/vim-fugitive
ensure vim-plugin tpope/vim-rake
ensure vim-plugin tpope/vim-surround
ensure vim-plugin tpope/vim-eunuch
ensure vim-plugin kien/ctrlp.vim
ensure vim-plugin rodjek/vim-puppet
ensure vim-plugin tpope/vim-markdown
ensure vim-plugin airblade/vim-gitgutter
ensure vim-plugin fatih/vim-go
ensure vim-plugin bling/vim-airline
ensure vim-plugin honza/dockerfile.vim
ensure vim-plugin hail2u/vim-css3-syntax
ensure vim-plugin groenewege/vim-less
ensure vim-plugin altercation/vim-colors-solarized

# vim: set ft=sh :
```

It's just a bunch of shell scripts. There's nothing fancy going on here.

## Installing

```
./configure --prefix /usr/local
make install
```

## Usage

Define your manifest file in `~/.ensure/manifest`. Run `ensure` to ensure
everything is installed. If something isn't, it should install it.

Run `ensure --disable-services` to stop any services installed with ensure. Run
`ensure --enable-services` to re-start them.

## Contributions

PRs are welcome :)

## License

See the attached LICENSE file.
