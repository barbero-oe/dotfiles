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

export EDITOR=nvim
export VISUAL=nvim
export NVM_AUTO_USE=true
export NVM_LAZY_LOAD=true

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
# Sets default color to black.
# White would be: $'\033[37m'
# Black would be: $'\033[30m'
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

if [[ -d "$HOME/.volta" ]]; then
    # Volta - https://volta.sh/
    # Node and related shims
    # curl https://get.volta.sh | zsh
    export VOLTA_HOME="$HOME/.volta"
    export PATH="$VOLTA_HOME/bin:$PATH"
fi

if [[ -d "$HOME/.pyenv" ]]; then
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
fi

### Aliases ###
alias vim="nvim"
alias vimdiff='nvim -d'
alias ls='exa --all --classify'
alias l='exa --oneline --all --classify'
alias ll='exa --long --all --classify'
alias tree="exa --tree --icons"
alias less="less --ignore-case"
# alias doom="~/.emacs.d/bin/doom"
alias j="z"
alias cdr='cd "$(project-root)"'
alias rg='rg --smart-case'

cdf() {
    local dir="$(fd --type directory | fzf)"
    [[ -d "$dir" ]] && cd "$dir"
}

# Kubernetes
alias k="kubectl"
alias kd="kubectl get deployments"
alias kdd="kubectl describe deployment"
alias kp="kubectl get pods"
alias kdp="kubectl describe pod"
alias kl="kubectl logs"
alias kj="kubectl get jobs"
alias kdj="kubectl describe job"
alias ks="kubectl get services"
alias kds="kubectl describe service"
alias kh="kubectl get hpa"
alias kdh="kubectl describe hpa"
alias kn="kubectl get namespaces"
alias kdn="kubectl describe namespace"
alias kpf="kubectl port-forward"

# git
alias st="git status"
alias br='git branch'
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

ckb() {
    git checkout $(git branch | fzf)
}

project-root() {
    local dir_path="$(realpath "${1:-.}")"
    while ! [[ -e "$dir_path/.git" ]]; do
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

# ❯ jq -n --arg foo boo '$ARGS.named'
# { "foo": "boo" }
# 
# ❯ jq -n --arg foo boo '$ARGS.named' > foo.json
# 
# ❯ echo "$<foo.json "
# { "foo": "boo" }


if [[ -d "$HOME/.sdkman" ]]; then
    #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi


[[ -d "$HOME/bin" ]] && export PATH="$PATH:$HOME/bin" 
[[ -f "$HOME/.local_custom_settings" ]] && source "$HOME/.local_custom_settings" 
[[ -f "$HOME/.local_custom_envs" ]] && source "$HOME/.local_custom_envs" 
