# Public: Ensure homebrew is installed and up-to-date.
#
# Usage: ensure_brew
#
ensure_brew() {
  if ! command -v brew >/dev/null; then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi
  brew update >/dev/null;
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

  for arg in $@; do
    [ "$arg" = "--link" ] && link=true;
    [ "$arg" = "--service" ] && service=true;
  done

  if $(brew info "$package" | grep "Not Installed"); then
    echo ">> Installing ${package}"

    brew install "$package";

    if [ -n "$link" ]; then
      brew unlink $package >/dev/null;
      brew link -f $package >/dev/null;
    fi

    if [ -n "$service" ]; then
      ln -sfv "$(brew --prefix)/opt/${package}/*.plist" ~/Library/LaunchAgents;
      launchctl load "~/Library/LaunchAgents/homebrew.mxcl.${package}.plist";
    fi
  fi
}
