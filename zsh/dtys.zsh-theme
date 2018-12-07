# Customized version of the 'ys' theme from Yad Smood.
# Author: Duncan Tilley

# Version control section
VCS_PROMPT_PREFIX=" %{$fg[white]%}on%{$reset_color%} %{$fg[blue]%}"
VCS_PROMPT_SUFFIX="%{$reset_color%}"
VCS_PROMPT_DIRTY="%{$fg[yellow]%}[+]"
VCS_PROMPT_CLEAN=""

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${VCS_PROMPT_PREFIX}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$VCS_PROMPT_CLEAN"

local exit_code="%(?,,!%{$fg[red]%}%?%{$reset_color%})"

# Prompt format
PROMPT="\
%(#,%{$fg[red]%}%n%{$reset_color%},%{$fg[blue]%}%n)\
%{$fg[white]%}@\
%{$fg[green]%}%m \
%{$fg[white]%}in \
%{$fg[magenta]%}%3~%{$reset_color%}\
${git_info} \
 $exit_code
%{$fg[blue]%} > %{$reset_color%}"
