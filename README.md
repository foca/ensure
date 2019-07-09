# Ensure

A simple utilty to install things on your Mac.

## Example

This is a part of my personal manifest (`~/.ensure/manifest`):

``` sh
ensure package bash
ensure package bash-completion
ensure shell "$(brew --prefix)/bin/bash"

ensure package macvim -- --with-override-system-vim
ensure package screen
ensure package git
ensure package hub
ensure package ack

ensure package libxslt --link
ensure package libxml2 --link
ensure package readline
ensure package openssl

ensure package postgresql --service
ensure package redis --service

ensure ruby "2.4.1"

ensure package node
ensure npm bower

ensure app iterm2
ensure app charles
ensure app limechat
ensure app google-chrome --copy
ensure app sketch
ensure app slack
ensure app spectacle

ensure vim-plugin altercation/vim-colors-solarized
ensure vim-plugin tpope/vim-commentary
ensure vim-plugin tpope/vim-fugitive
ensure vim-plugin tpope/vim-rake
ensure vim-plugin tpope/vim-surround
ensure vim-plugin tpope/vim-eunuch
ensure vim-plugin tpope/vim-markdown
ensure vim-plugin airblade/vim-gitgutter
ensure vim-plugin fatih/vim-go
ensure vim-plugin honza/dockerfile.vim
ensure vim-plugin hail2u/vim-css3-syntax
ensure vim-plugin groenewege/vim-less

# vim: set ft=sh :
```

It's just a bunch of shell scripts. There's nothing fancy going on here.

## Your first `ensure` run in a fresh machine

In a brand new Mac the `/usr/local` directory is owned by `root`, and only after installing Homebrew it's `chown`ed to your user. This means that you won't be able to follow the [installation instructions](#Installing) without `sudo`. You can use the following steps to run `ensure` for the first time to let it install Homebrew for you:

1. Clone `ensure` locally.
2. `cd` to the directory where you cloned.
3. Run `$ PATH="./bin:$PATH" ensure`.

## Installing

```
./configure --prefix /usr/local
make install
```

## Usage

Define your manifest file in `~/.ensure/manifest`. Run `ensure` to ensure
everything is installed. If something isn't, it should install it.

### `ensure` options

* Verbosity: `ensure -v`, `-vv` and `-vvv` will increase the verbosity level. By default `ensure` shows no output.
* Manifest file: `ensure -f <file>`. Uses `<file>` instead of the `~/.ensure/manifest` default.

## Contributions

PRs are welcome :)

## License

See the attached LICENSE file.
