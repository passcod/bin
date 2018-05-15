# Create a directory and cd to it
mkcd() {
  if [ -z "$1" ]
  then
    echo "Usage: mkcd DIRNAME"
  else
    mkdir $1
    cd $1
  fi
}

# Save current directory (pwd) in ~/.ppwd
# Go back to it with ppcd. Useful when ssh
# sessions timeout and you don't feel like
# cd'ing manually every time.
ppwd() { echo "`pwd`" > ~/.ppwd; }
ppcd() { cd `cat ~/.ppwd`; }

# Create a directory, cd to it, init a git
# repo, and create the (empty) initial commit
mkgit() {
  if [ -z "$1" ]
  then
    echo "Usage: mkgit DIRNAME"
  else
    mkcd $1
    git init
    git commit --allow-empty -m "Initial Commit"
  fi
}

set_proxy() {
  if [ -z "$1" ]
  then
    echo "Usage: set_proxy <proxy>"
  else
    export HTTP_PROXY=$1
    export http_proxy=$1
    export HTTPS_PROXY=$1
    export https_proxy=$1
    export SOCKS_PROXY=$1
    export socks_proxy=$1
  fi
}

unset_proxy() {
  unset {HTTP{,S},SOCKS}_PROXY
  unset {http{,s},socks}_proxy
}

alias cloc="cloc --processes=$(nproc)"
