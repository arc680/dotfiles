# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

## Default shell configuration
#
# set prompt
#


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

autoload colors
colors
#PROMPT="%{${fg[blue]}%}%{${reset_color}%}"
#case ${UID} in
#0)
###
#PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
#PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
#SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
#[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
###
#PROMPT="%{%(?.$fg[green].$fg[red])%}% ${USER}@%m%(!.#.$) %{$reset_color%} "
#echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
#echo -ne "\ek$(hostname|awk 'BEGIN{FS="."}{print $1}')\e\\"
##
#PROMPT="%{${fg[green]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
#PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
#SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
#RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"
###
#  PROMPT="${PROMPT} %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
local p_cdir="%B%{${fg[red]}%}[%/]%{${reset_color}%}%b"$'\n' # カレントディレクトリを最初の行に
local p_info="%{${fg_bold[white]}%}%n%{${reset_color}%}@%{${fg[blue]}%}%m%{${reset_color}%}" # ユーザとホスト名を
PROMPT="$p_cdir$p_info$ "
## さいきんつかってるやつ
#  PROMPT="${PROMPT}%{${fg[red]}%}%/%(!.#.%%)%{${reset_color}%} "
#  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
#  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
#  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
#  ;;
#*)
#  PROMPT="${PROMPT} %{${fg[red]}%}%/%%%{${reset_color}%} "
#  PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
#  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
#  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
#  ;;
#esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes
# to end of it)
#
bindkey -e

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

## Completion configuration
#
autoload -U compinit
compinit

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"


## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac


# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
  preexec() {
    mycmd=(${(s: :)${1}})
    echo -ne "\ek$(hostname|awk 'BEGIN{FS="."}{print $1}'):$mycmd[1]\e\\"
  }
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

#PROMPT+='$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

## load user .zshrc configuration file
#
case "${OSTYPE}" in
# MacOSX
darwin*)
    [ -f ~/.zshrc.osx ] && source ~/.zshrc.osx
    ;;
linux*)
    [ -f ~/.zshrc.linux ] && source ~/.zshrc.linux
    ;;
esac
[ -f ~/.zshrc.compctl ] && source ~/.zshrc.compctl

