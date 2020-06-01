PROMPT='$reset_color
$fg_bold[cyan]%n $reset_color$fg[black]at$reset_color $fg[yellow]%m $fg[black]:: $reset_color$fg_bold[black]$(get_pwd)$(git_prompt_info)
$reset_color$fg[black]--> $reset_color'

function get_pwd() {
	echo "${PWD/$HOME/~}"
}
function git_prompt_info() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo "$reset_color$fg[black] on $(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"
