PATH=`defaults read ~/.MacOSX/environment PATH`:$PATH

export PATH=~/bin:/usr/local/bin:/usr/local/opt/ruby/bin:$PATH

# OPAM configuration
. /Users/mark/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

alias git=hub

source ~/.github

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [[ -s $HOME/.rvm/scripts/rvm ]]; then
  source $HOME/.rvm/scripts/rvm;
fi

# Added for Emacs on 17 Jan 2014
export EDITOR=emacsclient

# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir[master]$   # clean working directory
#   username@Machine ~/dev/dir[master*]$  # dirty working directory
 
function parse_git_dirty {
    status="$(git status 2> /dev/null | tail -n1)"
  [[ $status != "nothing to commit, working directory clean" && $status != 'nothing added to commit but untracked files present (use "git add" to track)' ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}
export PS1='\u@\h:\W$(parse_git_branch)$ '

# Added 08 Feb 2014 for COLOR
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
alias ls="ls -G"

alias today="emacsclient `date "+%d-%b-%Y"`"

# Added 16 April 2014 for to make vagrant work w/ Dropbox
export VAGRANT_DOTFILE_PATH=.vagrant-`hostname -s`
