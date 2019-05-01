source ~/.dotfiles/bashzshrc

# Customize the shell prompt to include the current checked-out branch and dirty status:
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1='\[$(tput bold)\]\[\e[38;05;28m\]\W\[\e[38;05;91m\]$(parse_git_branch) \$\[\e[0m\] '

# History #

export HISTSIZE=""
export HISTFILESIZE=""
# no duplicate entries
export HISTCONTROL=ignoredups:erasedups
# append to history, don't overwrite it
shopt -s histappend
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
