#export JAVA_HOME='/Library/Java/Home'
#export _JAVA_OPTIONS='-Dfile.encoding=UTF-8'

#alias chhosts='$HOME/bin/chhosts'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'

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

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

[ -f ~/.local.macos.zsh ] && source ~/.local.macos.zsh