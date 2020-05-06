#!/usr/bin/env bash

### adapted from wonderful: https://github.com/tj/git-extras/blob/master/install.sh

command -v docker >/dev/null 2>&1 && (
  dce::install() {
    if [ -n "${PREFIX}" ]; then
      PREFIX="${PREFIX}" make -i "${1}" install
    else
      sudo make -i "${1}" install
    fi
  }
  dce::clone() {
    git clone "${CLONE_URL-"https://github.com/kornicameister/docker-compose-extra.git"}" \
      --depth "${CLONE_DEPTH-10}" \
      "${1}" \
      &>/dev/null
  }

  dir="$(mktemp -t -d dce-install.XXXXXXXXXX)"
  pwd="${PWD}"

  cd "${dir}" &&
    echo "Setting up 'docker-compose-extra'" &&
    dce::clone "${PWD}/dce" &&
    dce::install "${PWD}/dce" &&
    cd "${pwd}" || exit 2

  rm -rf "$dir"
  exit 0
)

echo "git is required to install like that"
exit 1
