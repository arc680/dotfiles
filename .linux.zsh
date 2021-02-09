export PATH="$HOME/local/bin:$PATH"

if [ -x $HOME/local/bin/vim ]; then
alias vim="$HOME/local/bin/vim"
fi

if [ -x $HOME/local/bin/tmux ]; then
    alias tmux="LD_LIBRARY_PATH=$HOME/local/lib $HOME/local/bin/tmux"
    if [ $TERM != "tmux" ]; then
        if [ $TERM != "dumb" ]; then
            tmux a
            #screen -e ^z^z
            #screen -d -RR
        fi
    fi
fi

#agent="$HOME/tmp/ssh-agent-$USER"
#if [ -S "$SSH_AUTH_SOCK" ]; then
#    case $SSH_AUTH_SOCK in
#        /tmp/*/agent.[0-9]*)
#        ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
#    esac
#elif [ -S $agent ]; then
#    export SSH_AUTH_SOCK=$agent
#else
#    echo "no ssh-agent"
#fi

case "${TERM}" in
    screen*)
    preexec() {
        printf "\ek$1\e\\"
    }
    precmd() {
        printf "\ek$(basename $(pwd))\e\\"
    }
esac

# git
if [[ $ZSH_VERSION == (<5->|4.<4->|4.3.<10->)* ]]; then
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' formats '(%s)-[%b]'
    zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
    precmd () {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }
    RPROMPT="%1(v|%F{green}%1v%f|)"
fi

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

[ -f ~/.local.linux.zsh ] && source ~/.local.linux.zsh