# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR="nvim"
export VISUAL="nvim"

# Z
# > brew install z
# source /usr/local/etc/profile.d/z.sh

# FZF
# source "$HOME/.fzf.zsh"
#export FZF_PREVIEW=1
# Custom fzf options to set the theme to light
# Also, it loads the function lessfilter-fzf located in
# fzf-zsh-plugin/bin/lessfilter-fzf
fzf_default_opts+=(
    "--layout=reverse"
    "--info=inline"
    "--height=80%"
    "--multi"
    "--preview='lessfilter-fzf {}'"
    "--preview-window='default'"
    "--color='light'"
    "--prompt='∼ '"
    "--pointer='▶'"
    "--marker='✓'"
    "--bind '?:toggle-preview'"
    "--bind 'ctrl-a:select-all'"
    "--bind 'ctrl-e:execute(vim {+} >/dev/tty)'"
    "--bind 'ctrl-v:execute(code {+})'"
)
export FZF_DEFAULT_OPTS=$(printf '%s\n' "${fzf_default_opts[@]}")
# export FZF_PREVIEW_WINDOW="default"
# export FZF_PREVIEW_ADVANCED=true

# fzf-tab autocomplation of commands
# Sets default color to black. White would be: '\033[37m'
zstyle ':fzf-tab:*' default-color $'\033[30m'
zstyle ':fzf-tab:*' fzf-flags '--preview-window=hidden'

# Zsh Plugins
# Using [Antibody](https://getantibody.github.io/)
# > brew install antibody
# List the plugins in ~/.zsh_plugins.txt and to static load them:
# > antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source "$HOME/.zsh_plugins.sh"
bindkey '^ ' autosuggest-accept
# CLI env info [StarShip](https://starship.rs/)
eval "$(starship init zsh)"

# Volta - https://volta.sh/
# Node and related shims
# curl https://get.volta.sh | zsh
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Pyenv
# Python shims and virtual envs
# https://github.com/pyenv/pyenv
# https://github.com/pyenv/pyenv-virtualenv

export PYENV_ROOT="$HOME/.pyenv"
# Hides python version name. StarShip already takes care of this
export VIRTUAL_ENV_DISABLE_PROMPT=1
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

### Aliases ###
alias vim="nvim"
alias ls="exa -a"
alias l="exa -1a"
alias ll="exa -la"
alias tree="exa --tree"
alias less="less --ignore-case"
# alias doom="~/.emacs.d/bin/doom"
alias j="z"
alias cdr='cd "$(project-root)"'

cdf() {
    local dir="$(fd --type directory | fzf)"
    [[ -d "$dir" ]] && cd "$dir"
}

# git
alias st="git status"
alias gps="git push"
alias gpl="git pull"
alias gpf="git fetch"
alias ck="git checkout"
alias ckm="git checkout master"
alias ckn="git checkout main"
alias ckd="git checkout develop"
alias ckr="git checkout release"
alias lg="git lg"
alias gd="git diff"
alias gds="git diff --staged"
alias ga="git add ."
alias gm="git commit -m "

project-root() {
    local dir_path="$(realpath "${1:-.}")"
    while ! [[ -d "$dir_path/.git" ]]; do
        if [ "$dir_path" = '/' ] || [ "$dir_path" = "" ]; then
            return 1
        fi
        dir_path="$(dirname "$dir_path")"
    done
    echo "$dir_path"
}

pv() {
  local preview="git diff --color=always $@ -- "$(project-root)/{-1}""
  local names=("`git diff --name-only $@`")
  git diff --name-only $@ | fzf -m --ansi --preview $preview
}

pvs() {
  local preview="git diff --staged --color=always $@ -- "$(project-root)/{-1}""
  git diff --name-only --staged $@ | fzf -m --ansi --preview $preview
}

img() {
    local imgs=("`fd --extension png -e jpg -e jpeg -e gif | fzf`")
    for img_path in $imgs; do
        chafa "$img_path" 
        echo "$img_path"
    done

}

[[ -f "$HOME/.local_custom_settings" ]] && source "$HOME/.local_custom_settings" 
