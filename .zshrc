HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

if [ $UID = 0 ]; then
  unset HISTFILE
  SAVEHIST=0
fi

setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups

bindkey -e


autoload -U colors && colors

setopt prompt_subst

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt list_packed
setopt complete_aliases
setopt noautoremoveslash

zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
        /usr/sbin /usr/bin /sbin /bin

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*:default' menu select

#RVM
[[ -s "/Users/ryumu/.rvm/scripts/rvm" ]] && source "/Users/ryumu/.rvm/scripts/rvm"


autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()

    # for vcs_info
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
VCS_PROMPT="%1(v|%F{green} %1v%f|)"
PROMPT=$'%{\e[32m%}$LOGNAME@${WINDOW:+"[$WINDOW]"}%B:%b%{\e[m%}[%~]$(rvm_info_for_prompt)$VCS_PROMPT\n%% '

function rvm_info_for_prompt {
  ruby_version=$(~/.rvm/bin/rvm-prompt)
  if [ -n "$ruby_version" ]; then
    echo "%F{magenta}($ruby_version)%f"
  fi
}


# ^で上のディレクトリ
function cdup() {
  echo
  cd ..
  zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup



#alias
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w -F"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias ll="ls -l"
alias la="ls -a"

alias du="du -h"
alias df="df -h"

alias su="su -l"

case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

__rvm_project_rvmrc

cd .
