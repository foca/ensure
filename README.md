# Ensure

A simple utilty to install things on your mac.

## Example

This is most of my personal manifest (`~/.ensure/manifest`):

``` sh
ensure_brew

ensure_package macvim -- --override-system-vim
ensure_package screen
ensure_package git
ensure_package hub
ensure_package ack
ensure_package bash
ensure_package bash-completion
ensure_package cloc
ensure_package tree
ensure_package ctags
ensure_package wget -- --default-names
ensure_package imagemagick
ensure_package htop

ensure_tap educabilia/tooling
ensure_package bs

ensure_tap homebrew/dupes
ensure_package grep -- --default-names

ensure_package go
ensure_package gpm
ensure_package gvp

ensure_package libxslt --link
ensure_package libxml2 --link
ensure_package libiconv --link
ensure_package readline --link
ensure_package gnu-getopt --link
ensure_package openssl --link
ensure_package icu4c --link
ensure_package libsodium

ensure_package postgresql --service
ensure_package memcached --service
ensure_package redis --service
ensure_package dnsmasq --service
cp /usr/local/opt/dnsmasq/dnsmasq.conf.example /usr/local/etc/dnsmasq.conf

ensure_package chruby
ensure_package ruby-install
ensure_ruby "2.1.2"

ensure_package node
ensure_npm bower

ensure_vim_pathogen

ensure_vim_plugin mileszs/ack.vim
ensure_vim_plugin tpope/vim-commentary
ensure_vim_plugin tpope/vim-fugitive
ensure_vim_plugin tpope/vim-rails
ensure_vim_plugin tpope/vim-rake
ensure_vim_plugin tpope/vim-surround
ensure_vim_plugin tpope/vim-eunuch
ensure_vim_plugin kien/ctrlp.vim
ensure_vim_plugin rodjek/vim-puppet
ensure_vim_plugin tpope/vim-markdown
ensure_vim_plugin kchmck/vim-coffee-script
ensure_vim_plugin airblade/vim-gitgutter
ensure_vim_plugin altercation/vim-colors-solarized
ensure_vim_plugin fatih/vim-go

# vim: set ft=sh :
```

It's just a bunch of shell functions. There's nothing fancy going on here.

## Installing

```
curl -L https://raw.githubusercontent.com/foca/ensure/master/install.sh > /tmp/ensure.sh && sh /tmp/ensure.sh
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
