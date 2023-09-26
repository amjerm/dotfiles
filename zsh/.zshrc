############
# PATH     #
############

export PATH="${PATH}:${HOME}/.local/bin"
export PATH="${PATH}:${HOME}/.cargo/bin"
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
fpath+=("$(brew --prefix)/share/zsh/site-functions")
source "$HOME/.zsh_functions.zsh"

############
# SETTINGS #
############

bindkey -v
bindkey -s '^o' 'lfcd\n'

############
# ENV      #
############

# CONFIG FILES
DOTFILE_DIR="$HOME/code/amjerm/dotfiles"
TMUX_CONFIG="$HOME/.tmux.conf"
export NVIM_CONFIG="$XDG_CONFIG_HOME/nvim"
export WEZTERM_CONFIG_DIR="$$DOTFILE_DIR/wezterm"
export WEZTERM_CONFIG_FILE="$WEZTERM_CONFIG_DIR/wezterm.lua"
export XDG_CONFIG_HOME="$HOME/.config"
export ZSH_CONFIG="$HOME/.zshrc"
export ZSH_PLUGINS_CONFIG="$HOME/.zsh_plugins.txt"

# SETTINGS
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export PAGER='nvim -R'
export BAT_PAGER=less
export TIME_STYLE='long-iso'

# SECRETS / DYNAMIC
$(cat $HOME/.config/.env)
export CTS_LOCAL_TOKEN="$(cat $XDG_CONFIG_HOME/tokens/.contacts_service_localhost_token)"
export JIRA_API_TOKEN="$(cat $XDG_CONFIG_HOME/tokens/.jira_api_token)"
export LARAVEL_LOCAL_TOKEN="$(cat $XDG_CONFIG_HOME/tokens/.laravel_localhost_token)"

# SOFTWARE
# nnn
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_BMS="d:$HOME/code/tsi/docker;r:$HOME/code/tsi/docker/repos"

#####################
# LOCAL VARIABLES   #
#####################

DEV_BRANCH="develop"
EMAIL='himalaya'
MAIN_BRANCH="git symbolic-ref refs/remotes/origin/HEAD | grep -o '[a-zA-Z]*$'"
TSI_ARTISAN_PATH="/var/www/laravel/artisan"
TSI_DB_LOCAL_CHILI="-h localhost -P 3309 -u root"
TSI_DB_LOCAL_LARAVEL="-h localhost -P 3307 -u root"
TSI_DB_LOCAL_WP="-h localhost -P 3308 -u root"

############
# ALIASES  #
############

alias da="dex laravel $TSI_ARTISAN_PATH"
alias daa="da migrate --seed  && da queue:restart"
alias edit="$EDITOR"
alias email="$EMAIL"
alias en="edit $NVIM_CONFIG"
alias et="edit $TMUX_CONFIG"
alias ew="edit $WEZTERM_CONFIG_FILE"
alias ez="edit $ZSH_CONFIG"
alias ezp="edit $ZSH_PLUGINS_CONFIG"
alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"
alias firefoxd="/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox"
alias fsc="npm run cl:scopes -- -q $1"
alias jrh="jira_release_helper"
alias lt="ls --tree --level=2"
alias mem="cat $HOME/Documents/reference/memory-reference.txt"
alias msc="mycli $TSI_DB_LOCAL_CHILI"
alias msl="mycli $TSI_DB_LOCAL_LARAVEL"
alias msw="mycli $TSI_DB_LOCAL_WP"
alias n="nnn"
alias nfy="terminal-notifier"
alias notify="terminal-notifier -title 'Done' -message 'Terminal process is done.'"
alias reload="omz reload"
alias rl="reload"
alias sb="start_branch $1"
alias sbf="start_branch $DEV_BRANCH"
alias sbh="start_branch $MAIN_BRANCH"
alias tk="tmux kill-ses"
alias tl="tmux ls"
alias tn="tmux new -s (pwd | sed 's/.*\///g')"
alias wtc="wezterm_set_color $1"
alias wtcl="cat $WEZTERM_CONFIG_DIR/functions/color_schemes.txt"
alias wtf="set_wezterm_font $1"
alias wtfs="grep font_size $WEZTERM_CONFIG_FILE"
alias wtto="curl 'wttr.in/austin?m&format=%t+%p+%m+%M\n'"
alias wttr="curl 'wttr.in/austin?mnQF1'"

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

# autoload -Uz promptinit && promptinit && prompt pure
eval "$(starship init zsh)"

#######################
# COMMAND OVERRIDES   #
#######################

alias cat="bat"
alias ls="eza --icons --group-directories-first -s name -alhb"

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
