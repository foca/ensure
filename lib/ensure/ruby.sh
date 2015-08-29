# Public: Ensure a certain ruby version is installed.
#
# Usage: ensure_ruby "2.1.0"
#
ensure_ruby() {
  source "$(brew --prefix chruby)/share/chruby/chruby.sh"

  local installed="";
  local target=$1;

  for ruby in $RUBIES; do
    if [[ "$ruby" == *$target* ]]; then
      installed="yes";
      break;
    fi
  done

  if [ -z "$installed" ]; then
    ruby-install ruby "$target";
  fi
}
