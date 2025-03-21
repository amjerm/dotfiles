function reload() {
  source ~/.zshenv
  source "$XDG_CONFIG_HOME/zsh/config.zsh"
}

function trysource() { 
  [[ ! -f $1 ]] || source $1
}

# change font size in wezterm config
function set_wezterm_font() {
  if [ "$1" = "large" ]; then
    SIZE="36"
  elif [ "$1" = "norm" ]; then
    SIZE="20"
  else
    SIZE="$1"
  fi
  sed -i '' -E "s/font_size.*$/font_size = $SIZE/" "$DOTFILE_REPO/wezterm/wezterm.lua"
}
alias wtf="set_wezterm_font $1"

function wezterm_set_color() {
  sed -i '' -E "s/local use_color = .*$/local use_color = '$1'/" "$DOTFILE_REPO/wezterm/wezterm.lua"
}
alias wtc="wezterm_set_color $1"

# get list of feature flags in a given staging environment
function ff() {
  ssh "s$1" "mysql -h stb2b$1db1a.i" < $HOME/code/tsi/database-queries/dev/feature-flags.sql --table
}

function get_ticket() {
  jira issue list -s~Closed -a$(jira me) --plain --columns KEY,SUMMARY | fzf
}

function get_ticket_status() {
    jira issue view $1 | rg $1
}

function list_one_ticket() {
    jira issue list -q "id = TI-$1" --columns key,status,summary
}

function list_one_ticket_obsidian () {
    jira issue list -q "id = TI-$1" --plain --columns key,labels | python3 $SCRIPTS_DIR/obsidian-helpers/fillStandupItem.py | pbcopy
}

function make_ticket_note_obsidian () {
    jira issue list -q "id = TI-$1" --plain --columns key,type,labels | python3 $SCRIPTS_DIR/obsidian-helpers/fillTicket.py
}

start_ticket() {
    TICKET_ID=$(jira issue list -a $(jira me) -q 'Sprint in openSprints() and statusCategory != Done' --columns key,status,summary --plain --no-headers | fzf | cut -f1) && jira issue move $TICKET_ID "Start" && make_ticket_note $TICKET_ID $JIRA_SPRINT $1
}

function make_ticket_note () {
    python3 $SCRIPTS_DIR/obsidian-helpers/allTicket.py $1 $2 $3
}

function make_branch() { 
  get_ticket | branchify -p adam -t $1
}

function start_branch() { 
  git checkout $1
  git pull

  if [ "$1" = "develop" ]; then
    type="feature"
  else
    type="hotfix"
  fi

  git checkout -b $(make_branch $type) $1
  # mark in progress
}


function fuzzy_diff() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

# connect to staging database
function mss() {
  eval "mycli -h stb2b$1db1a.i \
    -P $ST_DB_PORT \
    -u $ST_DB_USER \
    --pass $ST_DB_PASS \
    --ssh-host $ADMIN_SERVER_HOST \
    --ssh-port $ADMIN_SERVER_SSH_PORT \
    --ssh-user $ADMIN_SERVER_USER \
    --ssh-key-filename $ADMIN_SERVER_KEY"
}

# connect to staging database
function msq() {
  eval "mycli -h $1 \
    -P $ST_DB_PORT \
    -u $ST_DB_USER \
    --pass $ST_DB_PASS \
    --ssh-host $ADMIN_SERVER_HOST \
    --ssh-port $ADMIN_SERVER_SSH_PORT \
    --ssh-user $ADMIN_SERVER_USER \
    --ssh-key-filename $ADMIN_SERVER_KEY \
    --csv"
}

# cd on nnn quit
ncd ()
{
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }
    export NNN_TMPFILE="$XDG_CONFIG_HOME/nnn/.lastd"
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}

# cd on lf quit
lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}

# cd in yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
