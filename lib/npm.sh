ensure_npm() {
  if [ -n "$(npm list -g "$1" | grep "(empty)")" ]; then
    npm install -g "$1";
  fi
}
