PROMPT='
%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)$(kube_ps1)  $(emoji-clock) %{$fg_bold[magenta]%}%*%{$reset_color%}
%{$fg_bold[white]%}λ%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
