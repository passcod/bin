function mkcd -d "Create directories and cd into the last one"
  for d in $argv
    mkdir -p $d
  end
  and cd $argv[-1]
end

function mkgit -d "Init a git repo in a new directory and cd into it"
  mkcd $argv
  and git init
  and git commit --allow-empty -m "Initial Commit"
end

function mkpijul -d "Init a pijul repo in a new directory and cd into it"
  pijul init $argv
  and cd $argv
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

function privacy -d "Modify prompt for this session to always begin with a space"
  functions --copy fish_prompt _fish_prompt
  function fish_prompt
    _fish_prompt
    commandline " "
  end
end

function zed -d "Open zed workspace"
  if test -z "$argv"
    zeditor .
  else
    pushd $HOME/code
    zeditor $(rg "^$argv[1]:" zed.spaces | cut -d: -f2-)
    popd
  end
end
