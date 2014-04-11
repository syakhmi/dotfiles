autoload -U colors && colors

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr "$FG[196]●"
zstyle ':vcs_info:*' unstagedstr "$FG[178]●"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
theme_precmd() {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
    zstyle ':vcs_info:*' formats "[%b%c%u%B%$FG[091]]"
  } else {
    zstyle ':vcs_info:*' formats "[%b%c%u%B%F{red}●$FG[091]]"
  }

  vcs_info
}

setopt prompt_subst
PROMPT=$'%B$FG[028]%2c%B$FG[091]${vcs_info_msg_0_} $%{$reset_color%} '
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  RPROMPT='%B%F{blue}%m%{$reset_color%}'
fi

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
