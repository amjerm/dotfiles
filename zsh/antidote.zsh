#fpath+=("$(brew --prefix)/opt/antidote/share/antidote")
fpath+=($ANTIDOTE_FN_DIR)
autoload -Uz $fpath[-1]/antidote

PLUGINS_TXT="$XDG_CONFIG_HOME/zsh/plugins.txt"
PLUGINS_ZSH="$ZDOTDIR/.zsh_plugins.zsh"

if [[ ! $PLUGINS_ZSH -nt $PLUGINS_TXT ]]; then
  (antidote bundle <$PLUGINS_TXT >|$PLUGINS_ZSH)
fi

source $PLUGINS_ZSH
