function mkcd -d "Create directories and cd into the last one"
  for d in $argv
    mkdir -p $d
  end
  and cd $argv[-1]
end

function mkgit -d "Init git repos in new directories and cd into the last one"
  pushd
  and for d in $argv
    mkcd $d
    git init
    git commit --allow-empty -m "Initial Commit"
  end
  and cd $argv[-1]
  popd
end

function o -d "Open things"
  set cmd "$argv"
  if test -z "$cmd"
    set cmd '.'
  end

  if test ! -f "$cmd"
    if ruby -e "exit '$cmd'.to_i"
    else
      set cmd "http://localhost:$cmd"
    end
  end

  ruby -e "puts 'Opening ' + if '$cmd' == '.'; 'current directory'; else; '$cmd'; end + '...'"
  gio open "$cmd" > /dev/null &
end

function rbu -d "Update global gems"
  # Clean gems from old versions
  set gempath (gem environment gempath | cut -d: -f1)
  pushd $gempath
  and cd ..
  and for v in (ls)
    if test ! $v = (basename $gempath)
      echo rm -rf $v
      rm -rf $v
    end
  end
  popd

  # Install bundler and global gems
  pushd ~/bin
  and gem install --no-rdoc --no-ri bundler
  and bundle install --jobs=4 --path ~/.gem
  and bundle update
  popd
end

function set_proxy -d "Set the proxy settings"
  set p $argv[1]
  set -x HTTP_PROXY=$p
  set -x http_proxy=$p
  set -x HTTPS_PROXY=$p
  set -x https_proxy=$p
  set -x SOCKS_PROXY=$p
  set -x socks_proxy=$p
end

function unset_proxy -d "Unset the proxy settings"
  set -e {HTTP{,S},SOCKS}_PROXY
  set -e {http{,s},socks}_proxy
end

function privacy -d "Modify prompt for this session to always begin with a space"
  functions --copy fish_prompt _fish_prompt
  function fish_prompt
    _fish_prompt
    commandline " "
  end
end
