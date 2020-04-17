# ZSH Theme - Preview: https://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local PL_BRANCH_CHAR=$'\ue0a0'         # 


if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m %{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m %{$reset_color%}'
    local user_symbol='$'
fi

if [[ -n $(parse_git_dirty) ]] then
    ZSH_THEME_GIT_PROMPT_PREFIX="%{$terminfo[bold]$fg[yellow]%}‹$PL_BRANCH_CHAR "
    #local git_prompt_color='%{$terminfo[bold]$fg[yellow]%}‹$PL_BRANCH_CHAR'
    # local git_prompt_color='yellow'
else
    ZSH_THEME_GIT_PROMPT_PREFIX="%{$terminfo[bold]$fg[green]%}‹$PL_BRANCH_CHAR "
    #local git_prompt_color='%{$terminfo[bold]$fg[green]%}‹$PL_BRANCH_CHAR'
    # local git_prompt_color='%{$fg[green]%}‹$PL_BRANCH_CHAR'
    # local git_prompt_color='green'
fi

local current_dir='%{$terminfo[bold]$fg[blue]%}%~ %{$reset_color%}'
local git_branch='$(git_prompt_info)'
local rvm_ruby='$(ruby_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

PROMPT="
╭─${user_host}${current_dir}${rvm_ruby}${venv_prompt}%B${git_branch}%b
╰─%B${user_symbol}%b "
RPROMPT="%B${return_code}%b"

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$terminfo[bold]$fg[yellow]%}‹$PL_BRANCH_CHAR "
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$git_prompt_color%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$terminfo[bold]$fg[cyan]%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
