source ~/.zshenv

# P10K_INSTANT_PROMPT="$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" 
# if [[ -r $P10K_INSTANT_PROMPT ]]; then
#   source $P10K_INSTANT_PROMPT
# fi

if [[ $PKG_MGR == "homebrew" ]]; then
  # do something specific to homebrew
  export PATH="/opt/homebrew/bin:$PATH"
  export PATH="/opt/homebrew/sbin:$PATH"
  PKG_MGR_HOME="$(brew --prefix)/share"
  POWERLEVEL_THEME_FILE="$PKG_MGR_HOME/powerlevel10k/powerlevel10k.zsh-theme"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
elif [[ $PKG_MGR == "pacman" ]]; then
  # do something specific to pacman  
  PKG_MGR_HOME="/usr/share"
  export POWERLEVEL_THEME_FILE="$PKG_MGR_HOME/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme"
	  echo "Pacman package manager detected"
else
  echo "Package manager not recognized"
fi

############
# ENV      #
############

DOTFILE_REPO="$HOME/code/amjerm/dotfiles"

# XDG CONFIG FILES
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export POWERLEVEL9K_CONFIG_FILE="$XDG_CONFIG_HOME/zsh/p10k.zsh"

# XDG DATA MGMT
export AWS_CLI_HISTORY_FILE="$XDG_DATA_HOME/aws/history"
export AWS_CREDENTIALS_FILE="$XDG_DATA_HOME/aws/credentials"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_DATA_HOME/aws/shared-credentials"
export AWS_WEB_IDENTITY_TOKEN_FILE="$XDG_DATA_HOME/aws/token"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export NVM_DIR="$XDG_DATA_HOME/nvm"
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

fpath+=("$PKG_MGR_HOME/zsh/site-functions")
source "$XDG_CONFIG_HOME/zsh/funcs.zsh"

############
# SETTINGS #
############

bindkey -v
bindkey '^r' fzf-history-widget
bindkey '^ ' autosuggest-accept

# SOFTWARE

EMAIL='himalaya'
export BAT_PAGER=less
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export PAGER='nvim -R'
export TIME_STYLE='long-iso'

trysource "$XDG_CONFIG_HOME/zsh/zvm_config.zsh"
trysource "$XDG_CONFIG_HOME/zsh/nnn_config.zsh"

###############
# COMPLETIONS #
###############

source "$PKG_MGR_HOME/zsh-completions"
autoload -Uz compinit
compinit

############
# PLUGINS  #
############

eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"

source "$PKG_MGR_HOME/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
source "$CLONED_DIR/fzf-tab/fzf-tab.plugin.zsh"
source "$PKG_MGR_HOME/zsh-autosuggestions/zsh-autosuggestions.zsh"

############
# PROMPT   #
############

trysource "$POWERLEVEL_THEME_FILE"
trysource "$POWERLEVEL9K_CONFIG_FILE"

############
# COLORS   #
############

#ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=cyan,bold"
#ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=cyan,bold"
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

############
# ALIASES  #
############

trysource "$XDG_CONFIG_HOME/zsh/aliases.zsh"

############
# SYNTAX   #
############

source "$PKG_MGR_HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


############
# TERM     #
############

if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
  export TERM="xterm-256color"
fi
