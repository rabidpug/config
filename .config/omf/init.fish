balias ls 'exa' # ls
if which batcat 2>&1 >/dev/null
  balias bat 'batcat'
end
balias :q 'exit'
balias lh 'exa -a'
balias l 'exa -lbF --git'                                              # list, size, type, git
balias ll 'exa -lbGF --git'                                            # long list
balias llm 'exa -lbGd --git --sort=modified'                           # long list, modified date sort
balias la 'exa -lbhHigmuSa --time-style=long-iso --git --color-scale'  # all list
balias lx 'exa -lbhHigmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
balias lS 'exa -1'                                                     # one column, just names
balias lt 'exa --tree --level=2'                                       # tree
balias _ 'sudo'
balias grep 'grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

function gac
  if test -z "$argv[1]"; or test "$argv[1]" = '-p'
    echo 'No commit message provided. Using "quick commit"'
    set msg 'quick commit'
  else
    set msg $argv[1]
  end
  git add .
  git commit -m "$msg"
  if test "$argv[1]" = '-p'; or test "$argv[2]" = '-p'
    git push
  end
end

function mkcd
  mkdir -p argv
  cd argv
end

function grcd
  set dr (git rev-parse --show-toplevel 2>/dev/null)
  set pdr (git -C ../ rev-parse --show-toplevel 2>/dev/null)
  if test "$dr" = "$PWD"
    set dr $pdr
  end
  if test "$dr" != "$PWD"; and not test -z "$dr"
    cd $dr
  else
    echo not a git repo
  end
end


function e
  set s ''
  set -q EDITOR || set EDITOR vim
  if begin; test -f "$argv[1]"; and not test -w "$argv[1]" ; end; or test -d "(dirname "$argv[1]")"; and not test -w "(dirname "$argv[1]")"
    sudo =E $EDITOR $argv
  else
    $EDITOR $argv
  end
end
