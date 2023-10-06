P10K_INSTANT_PROMPT="$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" 
if [[ -r $P10K_INSTANT_PROMPT ]]; then
  source $P10K_INSTANT_PROMPT
fi

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
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"

# XDG STATE MGMT
export LESSHISTFILE="$XDG_STATE_HOME/less/lesshist"
export MYCLI_HISTFILE="$XDG_STATE_HOME/mycli/mycli-history"

############
# PATH     #
############

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="$XDG_BIN_HOME:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$XDG_DATA_HOME/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH"

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

#############
# FUNCTIONS #
#############

fpath+=("$(brew --prefix)/share/zsh/site-functions")

source "$XDG_CONFIG_HOME/zsh/funcs.zsh"

############
# SETTINGS #
############

bindkey -v
bindkey -s '^o' 'lfcd\n'

# SOFTWARE

EMAIL='himalaya'
export BAT_PAGER=less
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export PAGER='nvim -R'
export TIME_STYLE='long-iso'

trysource "$XDG_CONFIG_HOME/zsh/zvm_config.zsh"
trysource "$XDG_CONFIG_HOME/zsh/nnn_config.zsh"

############
# ALIASES  #
############

trysource "$XDG_CONFIG_HOME/zsh/aliases.zsh"

############
# PLUGINS  #
############

trysource "$XDG_CONFIG_HOME/zsh/antidote.zsh"

eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"

############
# PROMPT   #
############

# eval "$(starship init zsh)"

trysource "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"
trysource "$XDG_DATA_HOME/zsh/.p10k.zsh"

############
# COLORS   #
############

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=cyan,bold"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

