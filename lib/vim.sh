# Public: Ensure pathogen.vim is available.
#
# Usage: ensure_vim_pathogen
#
ensure_vim_pathogen() {
  mkdir -p "$HOME/.vim/autoload" "$HOME/.vim/bundle"
  [ -f "$HOME/.vim/autoload/pathogen.vim" ] ||
    curl -LSso "$HOME/.vim/autoload/pathogen.vim" "https://tpo.pe/pathogen.vim"
}

# Public: Ensure a given vim plugin is installed from GitHub.
#
# Usage: ensure_vim_plugin <user>/<repo>
#
# Example:
#
#   ensure_vim_plugin tpope/vim-ruby
#
ensure_vim_plugin() {
  local plugin="$1";
  local repo="$(echo $plugin | cut -d/ -f2)"

  [ -d "$HOME/.vim/bundle/$repo" ] ||
    git clone "https://github.com/$plugin" "$HOME/.vim/bundle/$repo"
}
