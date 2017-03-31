# Internal: Helper function to log only if `$ENSURE_VERBOSE` is set to a number
# greater than or equal than a target value.
#
# $1    - The target $ENSURE_VERBOSE value.
# $@... - Everything to be logged to STDERR.
log_if_more_verbose_than() {
  if [ "$ENSURE_VERBOSE" -ge "$1" ]; then
    shift
    echo $@;
  fi
}

# Internal: Print a formatted string to the terminal, without printing a
# newline. If the script is non-interactive, omits the format and just prints
# the message.
#
# $1 - Format string to use. For example `"1;31"` means bold red.
# $2 - The message to print.
format() {
  printf "\033[$1m$2\033[0m"
}

# Public: Log an error. This logs regardless of the verbosity level.
log_error() {
  log_if_more_verbose_than 0 "$(format "1;31" "ERROR:")" $@;
}

# Public: Log an informational message. Only if ensure is passed at least one `-v`.
log_info() {
  log_if_more_verbose_than 1 "$(format "36" "INFO: ")" $@;
}

# Public: Log a debug message. Only if ensure is passed at least two `-v` switches.
log_debug() {
  log_if_more_verbose_than 2 "$(format "35" "DEBUG:")" $@;
}

# Public: Log an error and exit the program.
abort() {
  log_error "$1";
  return ${2:-1};
}

# Public: Compute the absolute path for a script.
abspath() {
  if [[ -d "$1" ]]; then
    (cd "$1"; pwd);
  elif [[ -e "$1" ]]; then
    (cd "$(dirname "$1")"; echo "$(pwd)/$(basename "$1")");
  else
    abort "No such file or directory: $1";
  fi
}

# Public: "$ENSURE_OUTPUT" allows you to control where the output of programs is
# redirected based on the user's desired verbosity.
if [ "$ENSURE_VERBOSE" -ge 3 ]; then
  export ENSURE_OUTPUT="/dev/stdout";
else
  export ENSURE_OUTPUT="/dev/null";
fi
