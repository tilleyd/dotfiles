# Custom ZSH Theme
# Author: Duncan Tiley
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$fg[red]%}%n%{$reset_color%}'
else
    local user_host='%{$fg[blue]%}%n%{$reset_color%}'
fi

local current_dir='%{$fg[green]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="${user_host} ${current_dir}${git_branch} > "
RPS1="${git_branch}"
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

