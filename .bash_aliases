#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

alias cp='cp -i'
alias la='ls -A'
alias ll='ls -l'
alias l='ls -CF'
alias dc='docker-compose'
alias docker-cleanup-volumes='docker volume ls -qf dangling=true | xargs -r docker volume rm'
alias prettierandstandard='prettier --write "{app,test,bin}/**/*.js" && standard --fix'

_nvm_upgrade() {
  if [[ $# -eq 0 ]]; then
    echo "usage: nvm-upgrade <version>"
    return
  fi
  CURRENT_NODE=`node -v`
  echo "$CURRENT_NODE"
  nvm install $1 --reinstall-packages-from=$CURRENT_NODE
}
alias nvm-upgrade=_nvm_upgrade
