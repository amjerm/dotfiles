export NNN_PLUG="z:autojump;g:gitroot;i:getplugs"
export NNN_OPTS="H"

BLK="0B" CHR="0B" DIR="27" EXE="06" REG="00" HARDLINK="06" SYMLINK="9a" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

export NNN_BMS="d:$HOME/code/tsi/docker;r:$HOME/code/tsi/docker/repos"

export NNN_TMPFILE="$XDG_STATE_HOME/nnn/.lastd"

# change to last nnn directory
ncd ()
{
    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}
