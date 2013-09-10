~/bin
=====

## Guidelines

- This is usually placed *before* `/usr/bin` and similar entries
  in the PATH. 
- Programs should not contain personal information (incl. usernames,
  passwords, etc), so they can be adapted quickly and shared without
  worry.
- Programs should have either help messages or a description here.
- Programs are prefered over aliases and functions.
- External programs should be symlinked in place, and may either
  be installed to the system (e.g. `cfx`), or be cloned externally,
  or as submodules (e.g. `asciiio`), or alternatively, although that is
  not recommended, copied here (e.g. `hub`, `pgol`).
- The following environments (and only these) should be assumed:
  + Python 2 (as `/usr/bin/python2`)
  + Python 3 (as `/usr/bin/python3`)
  + Ruby 2 (as `/usr/bin/env ruby`)
  + Bash
  + Zsh
  + Perl 5
  + *Build essentials* (a C compiler, Autoconf, etc)
- If no authorship is indicated, [Félix Saparelli](https://passcod.name)
  should be assumed. If no license is indicated,
  [Public Domain](https://creativecommons.org/publicdomain/zero/1.0/)
  should [be assumed](https://passcod.name/license.html).

## Programs

### ascii-only

- Filters STDIN and rejects non-ascii and non-printable ascii.
- Useful when seeking a random string from /dev/random.

### asciiio

- Command-line utility for [ascii.io](http://ascii.io)
- Author: [Marcin Kulik](https://github.com/sickill)
- License: [MIT](https://github.com/sickill/ascii.io-cli/raw/master/LICENSE.txt)
- Repository: [sickill/ascii.io-cli](https://github.com/sickill/ascii.io-cli)
- Submoduled in vendor/asciiio

### bsnap

- Creates a snapshot of a btrfs subvolume in /home/_snapshots
- Expects /home/_snapshots/$(whoami) to exist and be writtable
  by the current user
- Used for some form of backup

### cask-merge-pr

- Tool to help merging PRs in [homebrew-cask](https://github.com/phinze/homebrew-cask)

### cfx

- Mozilla's [Addon Builder SDK](https://addons.mozilla.org/en-US/developers/docs/sdk/latest/)
- Author: [Mozilla](https://mozilla.org)
- License: [MPL 2.0 + libraries'](https://github.com/mozilla/addon-sdk/raw/master/LICENSE)
- Repository: [mozilla/addon-sdk](https://github.com/mozilla/addon-sdk)
- Installed system-wide in /opt/addon-sdk

### conky-start

- Start conky only if it's not running yet
- Used in a login script

### each

- Run a command on each argument, usually various files

### gopen

- Decrypt a file with gpg and [open](#open) it

### haps

- Makes an empty commit to ~/test/haps
- Used with lolcommits and various associated scripts to
  post non-code-related selfies

### hibernate

- Alias of `systemctl hibernate`

### hub

- Github's [git plugin](http://hub.github.com/)
- Author: [various](https://github.com/github/hub/graphs/contributors)
- License: [MIT](https://github.com/github/hub/raw/master/LICENSE)
- Repository: [github/hub](https://github.com/github/hub)
- [Downloaded](http://hub.github.com/standalone) to vendor/hub

### scr, sscr, iscr, isscr

- Scrot aliases
- Filename is of the form `Screen-%Y%W%u-%H%M%S.png`
- Moved to ~/Pictures/
- `s` prefix means "Select"
- `i` prefix means "Upload to imgur"

### netctl

- Alias for `sudo /usr/bin/netctl`
- Used with custom sudoers.d rules to allow my user to invoke
  netctl without typing a password.

### open

- Use xdg-open and redirection to mimic OS X's open

### pgol

- Conway's Game of Life [in Perl](http://www.perlmonks.org/?node_id=1008395)
- Author: [ambrus](http://www.perlmonks.org/?node_id=295576)
- License: unspecified
- Copied in vendor/ambrus-gol.pl

### ualog

- Retrieves logs from ZNC
- Delegates to remote utility

### versions

- Displays current versions of various programs
- Programs edited by hand, versions obtained through shell-fu

### wait-for

- Runs a command every time anything changes in one or more
  directories (doesn't support individual files)
