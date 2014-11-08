# Public: Ensure homebrew is installed and up-to-date.
#
# Usage: ensure_brew
#
ensure_brew() {
  if ! $(which brew >/dev/null); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew update >/dev/null;
}

ensure_tap() {
  local tap=$1;
  brew tap | grep "$tap" || brew tap "$tap";
}

# Public: Install a homebrew package if it's not installed.
#
# Usage: ensure_package <package> [--link] [--service]
#
# --link      Pass this option if the package is a library and you want to
#             force-link it to your global /usr/local/lib dir.
# --service   Pass this option if the package is a service and you want to
#             install the launchctl configuration to load the service at boot.
#
ensure_package() {
  local package=$1;
  local link;
  local service;
  local capture;
  local brew_args="$package";

  for arg in $@; do
    if [ -n "$capture" ]; then
      brew_args="$brew_args $arg";
    else
      [ "$arg" = "--" ] && capture="yes";
      [ "$arg" = "--link" ] && link="yes";
      [ "$arg" = "--service" ] && service="yes";
    fi
  done

  if [ -n "$(brew info "$package" | grep "Not installed")" ]; then
    echo ">> Installing ${package}"

    brew install $brew_args;

    if [ -n "$link" ]; then
      brew unlink $package >/dev/null;
      brew link -f $package >/dev/null;
    fi

    if [ -n "$service" ]; then
      mkdir -p "${HOME}/Library/LaunchAgents/"

      ln -sfv \
        "$(brew --prefix)/opt/${package}/homebrew.mxcl.${package}.plist" \
        "${HOME}/Library/LaunchAgents/";

      service="${HOME}/Library/LaunchAgents/homebrew.mxcl.${package}.plist";

      grep "$package $service" .services || echo "$package $service" >> .services;
      launchctl load $service;
    fi
  fi
}

# Public: Start all services tracked by this script.
#
# Usage: enable_services
#
enable_services() {
  while read line; do __toggle_service "load" "$line"; done < .services
}

# Public: Stop all services tracked by this script.
#
# Usage: disble_services
#
disable_services() {
  while read line; do __toggle_service "unload" "$line"; done < .services
}

# Internal: Turn a single service on or off.
#
# Usage: __toggle_service [load|unload] <path_to_plist>
#
__toggle_service() {
  operation="$1";
  service=$2;

  name=$(cut -d" " -f1 <<<"$line")
  plist=$(cut -d" " -f2 <<<"$line")

  [ "$operation" = "load" ] && \
    message=">> Starting $name" || \
    message=">> Stopping $name"

  echo $message;
  launchctl $operation "$plist";
}
