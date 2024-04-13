fish_vi_key_bindings
set -U fish_greeting

function n --wraps nnn --description 'support nnn quit and change directory'
    # Block nesting of nnn in subshells
    if test -n "$NNNLVL"
        if [ (expr $NNNLVL + 0) -ge 1 ]
            echo "nnn is already running"
            return
        end
    end

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "-x" from both lines below,
    # without changing the paths.
    if test -n "$XDG_CONFIG_HOME"
        set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    else
        set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
    end

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command function allows one to alias this function to `nnn` without
    # making an infinitely recursive alias
    command nnn -A $argv

    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm $NNN_TMPFILE
    end
end

alias e="emacsclient --create-frame --no-wait"
alias clc="calcurse"
alias g="nvim"
alias gf="g (fzf)"
alias gg="g ~/Documents/todo/todo.txt"
alias gl="g ~/Documents/todo/log.txt"
alias gt="cd ~/Documents/todo"
alias gs="g ~/Documents/scratch.txt"
alias gn="cd ~/Documents/notes"

fish_add_path "$HOME"/.local/share/cargo/bin
fish_add_path "$HOME"/.luarocks/bin
fish_add_path "$HOME"/.bun/bin
fish_add_path "$HOME"/.scripts
fish_add_path "$HOME"/.local/bin

set -x EDITOR 'kak'
set -x QT_QPA_PLATFORMTHEME qt5ct

set -x XDG_CONFIG_HOME "$HOME"/.config
set -x XDG_DATA_HOME "$HOME"/.local/share
set -x XDG_STATE_HOME "$HOME"/.local/state
set -x XDG_CACHE_HOME "$HOME"/.cache

set -x HISTFILE "$XDG_STATE_HOME"/bash/history
set -x CARGO_HOME "$XDG_DATA_HOME"/cargo
set -x GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -x LESSHISTFILE "$XDG_CACHE_HOME"/less/history
set -x PYTHONSTARTUP "$XDG_CONFIG_HOME/python/pythonrc"
set -x INPUTRC "$XDG_CONFIG_HOME"/readline/inputrc
set -x RUSTUP_HOME "$XDG_DATA_HOME"/rustup
set -x TEXMFVAR "$XDG_CACHE_HOME"/texlive/texmf-var
set -x WINEPREFIX "$XDG_DATA_HOME"/wine

set -x GOPATH "$HOME"/Documents/prog/go/
