# ssh agent
agent="$HOME/.ssh/ssh-agent-$USER"
if [ -S "$SSH_AUTH_SOCK" ]; then
    case $SSH_AUTH_SOCK in
        /tmp/*/agent.[0-9]*)
            #ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
            ln -nf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
    esac
elif [ -S $agent ]; then
    export SSH_AUTH_SOCK=$agent
else
    echo "no ssh-agent"
fi

# history
alias history='history -i'
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# 複数の zsh を同時に使う時など history ファイルに上書きせず追加する
setopt append_history
# zsh の開始・終了時刻をヒストリファイルに書き込む
setopt extended_history
# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups
# コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
# setopt hist_ignore_space
# シェルのプロセスごとに履歴を共有
setopt share_history
# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store
# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify
# auto change directory
setopt auto_cd
# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd
# command correct edition before each completion attempt
setopt correct
# compacked complete list display
setopt list_packed
# no remove postfix slash of command line
setopt noautoremoveslash
# no beep sound when complete list displayed
setopt nolistbeep

autoload -U compinit
compinit

case "${OSTYPE}" in
# macOS
darwin*)
    [ -f ~/.zshrc.macos ] && source ~/.zshrc.macos
    ;;
linux*)
    [ -f ~/.zshrc.linux ] && source ~/.zshrc.linux
    ;;
esac

