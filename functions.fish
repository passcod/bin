function mkcd -d "Create a directory and cd to it"
  if [ -z "$1" ]
    echo "Usage: mkcd DIRNAME"
  else
    mkdir -p $1
    cd $1
  end
end

function ppwd -d "Save current CWD"
  echo (pwd) > ~/.ppwd
end

function ppcd -d "Go back to directory saved by ppwd"
  cd (cat ~/.ppwd)
end

function mkgit -d "Init a git repo in a new directory"
  if [ -z "$1" ]
    echo "Usage: mkgit DIRNAME"
  else
    mkcd $1
    git init
    git commit --allow-empty -m "Initial Commit"
  end
end

function set_proxy -d "Set the proxy settings"
  if [ -z "$1" ]
    echo "Usage: set_proxy <proxy>"
  else
    set -x HTTP_PROXY=$1
    set -x http_proxy=$1
    set -x HTTPS_PROXY=$1
    set -x https_proxy=$1
    set -x SOCKS_PROXY=$1
    set -x socks_proxy=$1
  end
end

function unset_proxy -d "Unset the proxy settings"
  set -e {HTTP{,S},SOCKS}_PROXY
  set -e {http{,s},socks}_proxy
end
