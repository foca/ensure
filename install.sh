#!/bin/sh

set -e
[ -n "$DEBUG" ] && set -x

if [ -d /opt/ensure ]; then
  echo "/opt/ensure already exists. Aborting." >&2
  exit 1
fi

echo ">> We'll ask for your password to create /opt/ensure. Don't fret!"
sudo -ks -- "mkdir /opt/ensure && chown -R '$USER' /opt/ensure/"

echo ">> Downloading ensure..."
git clone -q https://github.com/foca/ensure /opt/ensure

echo ">> Bootstrapping..."
/opt/ensure/bin/ensure bootstrap

echo ">> All done!"
echo ">> Copy the following to your shell RC file and reload your env:"
echo
echo '       export PATH="$PATH:/opt/ensure/bin"'
echo
