############
# PATH     #
############

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="$XDG_BIN_HOME:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$XDG_DATA_HOME/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

fpath+=("$(brew --prefix)/share/zsh/site-functions")

source "$ZDOTDIR/.zsh_functions.zsh"

############
# SETTINGS #
############

bindkey -v
bindkey -s '^o' 'lfcd\n'

############
# ENV      #
############

DOTFILE_REPO="$HOME/code/amjerm/dotfiles"

# XDG CONFIG FILES
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# XDG DATA MGMT
export AWS_CLI_HISTORY_FILE="$XDG_DATA_HOME/aws/history"
export AWS_CREDENTIALS_FILE="$XDG_DATA_HOME/aws/credentials"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_DATA_HOME/aws/shared-credentials"
export AWS_WEB_IDENTITY_TOKEN_FILE="$XDG_DATA_HOME/aws/token"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"

# XDG STATE MGMT
export LESSHISTFILE="$XDG_STATE_HOME/less/lesshist"
export MYCLI_HISTFILE="$XDG_STATE_HOME/mycli/mycli-history"

# SETTINGS
EMAIL='himalaya'
export BAT_PAGER=less
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export PAGER='nvim -R'
export TIME_STYLE='long-iso'

# SOFTWARE
# nnn
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

#####################
# LOCAL VARIABLES   #
#####################

############
# ALIASES  #
############

alias edit="$EDITOR"
alias eg="edit $XDG_CONFIG_HOME/git/config"
alias email="$EMAIL"
alias en="edit $XDG_CONFIG_HOME/nvim"
alias et="edit $XDG_CONFIG_HOME/tmux/tmux.conf"
alias ew="edit $XDG_CONFIG_HOME/wezterm/wezterm.lua"
alias ez="edit $ZDOTDIR/.zshrc"
alias eza="eza --icons -a"
alias fsc="npm run cl:scopes -- -q $1"
alias lc="ls $XDG_CONFIG_HOME"
alias lt="ls --tree --level=2"
alias mem="cat $HOME/Documents/reference/memory-reference.txt"
alias tk="tmux kill-ses"
alias tl="tmux ls"
alias tn="tmux new -s (pwd | sed 's/.*\///g')"
alias weather="curl 'wttr.in/austin?mnQF1'"
alias weathero="curl 'wttr.in/austin?m&format=%t+%p+%m+%M\n'"
alias wtc="wezterm_set_color $1"
alias wtcl="cat $XDG_CONFIG_HOME/wezterm/color_schemes.txt"
alias wtf="set_wezterm_font $1"
alias wtfs="grep font_size $XDG_CONFIG_HOME/wezterm/wezterm.lua"

# OP Vault
alias aws="op plugin run -- aws"
alias gh="op run -- gh"
alias sgpt="op run -- sgpt"

############
# PLUGINS  #
############

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"

############
# PROMPT   #
############

eval "$(starship init zsh)"

############
# COLORS   #
############

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=cyan,bold"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

#######################
# APP SCRIPT RESULTS  #
#######################

# pnpm
export PNPM_HOME="/Users/adamjermstad/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
