#!/usr/bin/env bash

set -e
[ -n "$DEBUG" ] && set -x
cd "$(dirname "$0")"

source "lib/homebrew.sh"
source "lib/ruby.sh"
source "lib/npm.sh"

case "$1" in
  --enable-services)
    enable_services;
    exit 0;
    ;;

  --disable-services)
    disable_services;
    exit 0;
    ;;

  *)
    ;;
esac

ensure_brew

ensure_package git
ensure_package hub
ensure_package ack
ensure_package bash
ensure_package bash-completion
ensure_package chruby
ensure_package ruby-install
ensure_package cloc
ensure_package tree
ensure_package unrar
ensure_package ctags
ensure_package wget -- --default-names
ensure_package grep -- --default-names
ensure_package imagemagick

ensure_package libxslt --link
ensure_package libxml2 --link
ensure_package libiconv --link
ensure_package readline --link
ensure_package gnu-getopt --link
ensure_package openssl --link

ensure_package postgresql --service
ensure_package memcached --service
ensure_package redis --service

ensure_ruby "2.1.0"

ensure_package node
ensure_npm bower
