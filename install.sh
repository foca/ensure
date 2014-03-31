#!/usr/bin/env bash

set -e
[ -n "$DEBUG" ] && set -x
cd "$(dirname "$0")"
source "lib/homebrew.sh"

ensure_brew

ensure_package git
ensure_package hub
ensure_package ack
ensure_package bash
ensure_package bash-completion
ensure_package chruby
ensure_package ruby-build
ensure_package cloc
ensure_package tree
ensure_package unrar
ensure_package wget

ensure_package libxslt --link
ensure_package libxml2 --link
ensure_package libiconv --link
ensure_package readline --link

ensure_package postgresql --service
ensure_package memcached --service
ensure_package redis --service