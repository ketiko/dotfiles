#!/usr/bin/env bash

set -euo pipefail

echo -e "\033[0;32m>>>>> Starting asdf <<<<<\033[0m"

if [ ! -d ~/.asdf ]; then
  echo -e "\033[0;32m>>>>> Installing asdf github repo <<<<<\033[0m"
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  git -C ~/.asdf checkout "$(git -C ~/.asdf describe --abbrev=0 --tags)"

fi

if [ ! -d ~/.asdf ]; then
  mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
  asdf completion zsh >"${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
fi

source "$HOME/.asdf/asdf.sh"
if [ -f "$HOME/.asdf/completions/asdf.bash" ]; then
  source "$HOME/.asdf/completions/asdf.bash"
fi

echo -e "\033[0;32m>>>>> Installing asdf plugins <<<<<\033[0m"
test -d "$HOME/.asdf/plugins/direnv" || asdf plugin add direnv --verbose
test -d "$HOME/.asdf/plugins/golang" || asdf plugin add golang --verbose
test -d "$HOME/.asdf/plugins/gradle" || asdf plugin add gradle --verbose
test -d "$HOME/.asdf/plugins/helm" || asdf plugin add helm --verbose
test -d "$HOME/.asdf/plugins/java" || asdf plugin add java --verbose
test -d "$HOME/.asdf/plugins/krew" || asdf plugin add krew --verbose
test -d "$HOME/.asdf/plugins/kubectl" || asdf plugin add kubectl --verbose
test -d "$HOME/.asdf/plugins/kustomize" || asdf plugin add kustomize --verbose
test -d "$HOME/.asdf/plugins/minikube" || asdf plugin add minikube --verbose
test -d "$HOME/.asdf/plugins/nodejs" || asdf plugin add nodejs --verbose
test -d "$HOME/.asdf/plugins/python" || asdf plugin add python --verbose
test -d "$HOME/.asdf/plugins/ruby" || asdf plugin add ruby --verbose
test -d "$HOME/.asdf/plugins/rust" || asdf plugin add rust --verbose
test -d "$HOME/.asdf/plugins/sbt" || asdf plugin add sbt --verbose
test -d "$HOME/.asdf/plugins/scala" || asdf plugin add scala --verbose
test -d "$HOME/.asdf/plugins/terraform" || asdf plugin add terraform --verbose

echo -e "\033[0;32m>>>>> Ending asdf <<<<<\033[0m"
