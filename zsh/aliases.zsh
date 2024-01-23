alias e="edit"
alias edit="$EDITOR"
alias eg="edit $XDG_CONFIG_HOME/git/config"
alias email="$EMAIL"
alias en="edit $XDG_CONFIG_HOME/nvim"
alias et="edit $XDG_CONFIG_HOME/tmux/tmux.conf"
alias ew="edit $XDG_CONFIG_HOME/wezterm/wezterm.lua"
alias ez="edit $XDG_CONFIG_HOME/zsh/config.zsh"
alias eza="eza --icons -a"
alias fsc="npm run cl:scopes -- -q $1"
alias jc="op run -- jira issue create"
alias js="op run -- jira issue list -a $(jira me) -q 'Sprint in openSprints() and statusCategory != \"Done\"' --columns key,status,summary"
alias jsa="op run -- jira issue list -a $(jira me) -q 'Sprint in openSprints()' --columns key,status,summary"
alias lc="ls $XDG_CONFIG_HOME"
alias ls="eza"
alias lt="ls --tree --level=2"
alias mem="cat $HOME/Documents/reference/memory-reference.txt"
alias n="nnn -A"
alias nn="n && ncd"
alias tk="tmux kill-ses"
alias tl="tmux ls"
alias tn="tmux new -s (pwd | sed 's/.*\///g')"
alias weather="curl 'wttr.in/austin?mnQF1'"
alias weathero="curl 'wttr.in/austin?m&format=%t+%p+%m+%M\n'"
alias wtcl="cat $XDG_CONFIG_HOME/wezterm/color_schemes.txt"
alias wtfs="grep font_size $XDG_CONFIG_HOME/wezterm/wezterm.lua"

# OP Vault
alias sgpt="op run -- sgpt"
