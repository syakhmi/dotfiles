[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

####################################
########## Sahil's Stuff ###########
####################################

# Customize the shell prompt to include the current checked-out branch and dirty status:
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\u:\W\[\033[0;33m\]$(parse_git_branch)\[\e[0m\]$ '

function setup_git_branch {
  git push origin master:$1
  git checkout --track -b $1 origin/$1
}

alias bx="bundle exec"
alias bxr="bundle exec rails"
alias sgb="setup_git_branch"
export PATH=~/.cabal/bin:$PATH

export CLICOLOR=1
export TERM=xterm-color
