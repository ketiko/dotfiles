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

test -d "$HOME/.asdf/plugins/golang" || asdf plugin add golang https://github.com/kennyp/asdf-golang.git
test -d "$HOME/.asdf/plugins/helm" || asdf plugin add helm https://github.com/Antiarchitect/asdf-helm.git
test -d "$HOME/.asdf/plugins/java" || asdf plugin add java https://github.com/halcyon/asdf-java.git
test -d "$HOME/.asdf/plugins/gradle" || asdf plugin add gradle https://github.com/rfrancis/asdf-gradle
test -d "$HOME/.asdf/plugins/krew" || asdf plugin add krew https://github.com/bjw-s/asdf-krew.git
test -d "$HOME/.asdf/plugins/kubectl" || asdf plugin add kubectl https://github.com/asdf-community/asdf-kubectl.git
test -d "$HOME/.asdf/plugins/kustomize" || asdf plugin add kustomize https://github.com/Banno/asdf-kustomize.git
test -d "$HOME/.asdf/plugins/minikube" || asdf plugin add minikube https://github.com/alvarobp/asdf-minikube.git
test -d "$HOME/.asdf/plugins/nodejs" || asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
test -d "$HOME/.asdf/plugins/python" || asdf plugin add python https://github.com/asdf-community/asdf-python.git
test -d "$HOME/.asdf/plugins/ruby" || asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
test -d "$HOME/.asdf/plugins/rust" || asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git
test -d "$HOME/.asdf/plugins/sbt" || asdf plugin add sbt https://github.com/bram2000/asdf-sbt.git
test -d "$HOME/.asdf/plugins/scala" || asdf plugin add scala https://github.com/asdf-community/asdf-scala.git
test -d "$HOME/.asdf/plugins/terraform" || asdf plugin add terraform https://github.com/asdf-community/asdf-hashicorp.git

set +e # allow failures when installing the latest plugins
echo -e "\033[0;32m>>>>> Installing latest versions of asdf plugins <<<<<\033[0m"

for plugin in $(asdf plugin list); do
  echo -e "\033[0;32m>>>>> Installing latest version of asdf plugin $plugin <<<<<\033[0m"

  if [ "$plugin" == "java" ]; then
    # java doesn't have a latest
    asdf install java openjdk-21
    asdf global java openjdk-21
    continue
  fi

  asdf install "$plugin" latest && asdf global $plugin $(asdf latest $plugin)
done

asdf reshim

echo -e "\033[0;32m>>>>> Ending asdf <<<<<\033[0m"
