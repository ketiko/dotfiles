# profile
if [[ ${PROFILE_ZSH} == "true" ]]; then
  zmodload zsh/zprof
fi

source ~/.zi/bin/zi.zsh

zi ice wait lucid
zi light zsh-users/zsh-completions
zi light zsh-users/zsh-history-substring-search
SHOW_AWS_PROMPT=false
ZSH_THEME_AWS_PREFIX="(\uf270:"
ZSH_THEME_AWS_SUFFIX=")"
zi snippet OMZP::aws
zi ice wait lucid
zi light greymd/docker-zsh-completion
# https://github.com/Aloxaf/fzf-tab#install
# must load after compinit but before plugins like autosuggestions
zi ice wait lucid
zi light Aloxaf/fzf-tab
zi light zsh-users/zsh-autosuggestions

zi ice wait lucid
zi light chitoku-k/fzf-zsh-completions
zi ice wait lucid
zi light MenkeTechnologies/zsh-more-completions
zi ice wait lucid
zi snippet OMZP::git
zi ice wait lucid
zi snippet OMZP::docker-compose
# zi ice wait lucid
# zi snippet OMZP::docker
zi ice wait lucid
zi snippet OMZP::kubectl
zi ice wait lucid
zi snippet OMZP::kubectx
zi snippet OMZP::kube-ps1
zi ice wait lucid
zi snippet OMZP::pip

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"
ZSH_AUTOSUGGEST_USE_ASYNC=1
bindkey '^ ' autosuggest-accept

if command -v brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi


# See https://github.com/sorin-ionescu/prezto/blob/c0cdc12708803c4503cb1b3d7d42e5c1b8ba6e86/modules/completion/init.zsh#L53C1-L68C17
# Load and initialize the completion system ignoring insecure directories with a
# cache time of 20 hours, so it should almost always regenerate the first time a
# shell is opened each day.
autoload -Uz compinit
_comp_path="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"
# #q expands globs in conditional expressions
if [[ $_comp_path(#qNmh-20) ]]; then
  # -C (skip function check) implies -i (skip security check).
  compinit -C -d "$_comp_path"
else
  mkdir -p "$_comp_path:h"
  compinit -i -d "$_comp_path"
  # Keep $_comp_path younger than cache time even if it isn't regenerated.
  touch "$_comp_path"
fi
unset _comp_path

autoload -U +X bashcompinit && bashcompinit
zmodload -i zsh/complist

zstyle ':completion:*' use-cache on
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
  adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
  clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
  gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
  ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
  named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
  operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
  rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
  usbmux uucp vcsa wwwrun xfs '_*'

zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' accept-line enter

autoload -U colors && colors

# get the name of the branch we are on
function git_prompt_info() {
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
      ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
          echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Checks if working tree is dirty
parse_git_dirty() {
  local STATUS=''
  local FLAGS
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      FLAGS+=('--ignore-submodules=dirty')
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+=('--untracked-files=no')
    fi
    STATUS=$(command git status "${FLAGS[@]}" 2> /dev/null | tail -n1)
  fi
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

prompt_pygmalion_precmd(){
  gitinfo=$(git_prompt_info)
  gitinfo_nocolor=$(echo "$gitinfo" | perl -pe "s/%\{[^}]+\}//g")
  exp_nocolor="$(print -P \"$base_prompt_nocolor$gitinfo_nocolor$post_prompt_nocolor\")"
  prompt_length=${#exp_nocolor}

  nl=""

  if [[ $prompt_length -gt 40 ]]; then
    nl=$'\n%{\r%}';
  fi
  if command -v kube_ps1 &>/dev/null; then
    PROMPT="$base_prompt$gitinfo$(kube_ps1)$"
  else
    PROMPT="$base_prompt$gitinfo"
  fi

  if command -v aws_prompt_info &>/dev/null; then
    PROMPT="$PROMPT$(aws_prompt_info)"
  fi

  PROMPT="$PROMPT$nl$post_prompt"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{${fg[green]}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{${fg[yellow]}%}\U26a1%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

base_prompt="%{${fg[magenta]}%}%n%{$reset_color%}%{${fg[cyan]}%}@%{$reset_color%}%{${fg[yellow]}%}%m%{$reset_color%}%{${fg[red]}%}:%{$reset_color%}%{${fg[cyan]}%}%0~%{$reset_color%}%{${fg[red]}%}|%{$reset_color%}"
post_prompt="%{${fg[cyan]}%}⇒%{$reset_color%}  "

base_prompt_nocolor=$(echo "$base_prompt" | perl -pe "s/%\{[^}]+\}//g")
post_prompt_nocolor=$(echo "$post_prompt" | perl -pe "s/%\{[^}]+\}//g")

precmd_functions+=(prompt_pygmalion_precmd)

# Apply theming defaults
PS1="%n@%m:%~%# "

## Command history configuration
if [ -z "$HISTFILE" ]; then
  HISTFILE=$HOME/.zsh_history
fi

export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS # ignore duplication command history list
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_VERIFY
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY # share command history data

setopt no_beep
setopt multios

# Setup the prompt with pretty colors
setopt prompt_subst

## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## jobs
setopt long_list_jobs

unsetopt correct_all # spelling correction for arguments
unsetopt correct # spelling correction for commands

setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word # Allow completion from within a word/phrase

# vi mode
bindkey -v

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# https://robots.thoughtbot.com/how-to-use-arguments-in-a-rake-task
unsetopt nomatch

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "${terminfo[kcuu1]}" history-substring-search-up
bindkey "${terminfo[kcud1]}" history-substring-search-down
# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
source "$HOME"/.aliases

if [ -f "$HOME/.fzf.zsh" ]; then
  source "$HOME"/.fzf.zsh
fi

unalias zz 2> /dev/null
zz() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}
unalias vv 2> /dev/null
vv() {
  local file
  file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vi "${file}" || return 1
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v terraform &> /dev/null; then
  tf=$(which terraform)
  complete -o nospace -C "$tf" terraform
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

acps() {
  unset AWS_DEFAULT_PROFILE
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  if [ ! -z $1 ]; then
    export AWS_PROFILE=$1
  else
    export AWS_PROFILE=$(aws configure list-profiles | fzf -0 )
  fi
  export AWS_DEFAULT_PROFILE="$AWS_PROFILE"

  aws sts get-caller-identity > /dev/null 2>&1 || aws sso login
  echo "Switched to AWS Profile: $AWS_PROFILE"
}

if command -v kubectl &>/dev/null; then
  local completion_file="$HOME"/._completion_kubectl.zsh
  if [[ ! -a "$completion_file" ]]; then
    kubectl completion zsh > "$completion_file"
  fi
  source "$completion_file"
fi

if command -v flux &>/dev/null; then
  local completion_file="$HOME"/._completion_flux.zsh
  if [[ ! -a "$completion_file" ]]; then
    flux completion zsh > "$completion_file"
  fi
  source "$completion_file"
fi

# Homebrew
brew_prefixes=(/opt/homebrew /usr/local)
for prefix in ${brew_prefixes[@]}; do
  if [ -f "$prefix"/bin/brew ]; then
    eval $("$prefix"/bin/brew shellenv)
  fi
done

function kac() {
  local account=$1
  export AWS_PROFILE=${account}
  local cluster_name=$2
  aws eks update-kubeconfig --name ${cluster_name} --alias ${cluster_name}
}

function kinfo() {
  echo "K8S Info"
  echo "--------"
  echo "Cluster: $(kubectl config current-context)"
  echo "Namespace: $(kubens -c)"
}

function ksh() {
  kc
  kubens
  local choice=$(kubectl get pods -o custom-columns=NAME:.metadata.name --no-headers=true | fzf)
  kubectl exec -it $choice -- sh
}

function kexec() {
  local choice=$(kubectl get pods -o custom-columns=NAME:.metadata.name --no-headers=true | fzf)
  kubectl exec -it $choice -- sh
}

function krestart() {
  kc
  kubens
  kubectl rollout restart deployment
}

function git_clone_org() {
  curl -H "Authorization: token $1" -s "https://api.github.com/orgs/$2/repos?per_page=1000" \
    | sed -n '/"ssh_url"/s/.*ssh_url": "\([^"]*\).*/\1/p' \
    | sort -u \
    | xargs -n1 git clone;
  }

  if command -v vault &>/dev/null; then
    complete -o nospace -C /opt/homebrew/bin/vault vault
  fi

  if [ -d "$HOME/.asdf" ]; then
    source "$HOME"/.asdf/asdf.sh
    source $HOME/.asdf/completions/asdf.bash

    if [ -d "$HOME/.asdf/plugins/java" ]; then
      source $HOME/.asdf/plugins/java/set-java-home.zsh
    fi

    if [ -d "$HOME/.asdf/plugins/golang/set-env.zsh" ]; then
      source $HOME/.asdf/plugins/golang/set-env.zsh
    fi
  fi

# Slow
# if command -v minikube &>/dev/null; then
#   source <(minikube completion zsh)
# fi

if [ -d "$HOME/.rover/env" ]; then
  # apollo graphql rover
  source "$HOME/.rover/env"
fi

if command -v op &>/dev/null; then
  # 1password cli
  eval "$(op completion zsh)"; compdef _op op
fi

if [ -f "$HOME"/.zshrc.local ]; then
  source "$HOME"/.zshrc.local
fi

# Keep at the end per https://github.com/zsh-users/zsh-syntax-highlighting#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
zi light zsh-users/zsh-syntax-highlighting

# end profile
if [[ ${PROFILE_ZSH} == "true" ]]; then
  zprof
fi
