setopt PROMPT_SUBST


PROMPT='%F{cyan}┌─%f$fg_bold['green'][%n%F{blue}»%f%F{green}%m]%f%b %B$(virtualenv_prompt_info)%b%F{yellow}%~%f
%F{cyan}└──┤%f%B$(git_prompt_info)%b%F{white}λ%f '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%b%F{cyan}├─%f%B%F{red}[U]%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%b%F{cyan}├─%f%B%F{green}[C]%f"


ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[cyan]%}("
ZSH_THEME_VIRTUALENV_SUFFIX=")%{$reset_color%} "
