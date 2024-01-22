#!/usr/bin/env bash

set  -euo pipefail

echo -e "\033[0;32m>>>>> Starting asdf <<<<<\033[0m"

if [ ! -d ~/.asdf ]; then
  echo -e "\033[0;32m>>>>> Installing asdf github repo <<<<<\033[0m"
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  git -C ~/.asdf checkout "$(git -C ~/.asdf describe --abbrev=0 --tags)"

fi

source "$HOME/.asdf/asdf.sh"
source "$HOME/.asdf/completions/asdf.bash"

echo -e "\033[0;32m>>>>> Installing asdf plugins <<<<<\033[0m"

test -d "$HOME/.asdf/plugins/golang" || asdf plugin add golang
test -d "$HOME/.asdf/plugins/helm" || asdf plugin add helm
test -d "$HOME/.asdf/plugins/java" || asdf plugin add java
test -d "$HOME/.asdf/plugins/gradle" || asdf plugin add gradle
test -d "$HOME/.asdf/plugins/krew" || asdf plugin add krew
test -d "$HOME/.asdf/plugins/kubectl" || asdf plugin add kubectl
test -d "$HOME/.asdf/plugins/kustomize" || asdf plugin add kustomize
test -d "$HOME/.asdf/plugins/minikube" || asdf plugin add minikube
test -d "$HOME/.asdf/plugins/nodejs" || asdf plugin add nodejs
test -d "$HOME/.asdf/plugins/python" || asdf plugin add python
test -d "$HOME/.asdf/plugins/ruby" || asdf plugin add ruby
test -d "$HOME/.asdf/plugins/rust" || asdf plugin-add rust
test -d "$HOME/.asdf/plugins/sbt" || asdf plugin add sbt
test -d "$HOME/.asdf/plugins/scala" || asdf plugin add scala
test -d "$HOME/.asdf/plugins/terraform" || asdf plugin add terraform

echo -e "\033[0;32m>>>>> Ending asdf <<<<<\033[0m"
