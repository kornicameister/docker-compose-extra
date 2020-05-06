#!/usr/bin/env bash

### adapted from wonderful: https://github.com/tj/git-extras/blob/master/install.sh

command -v docker >/dev/null 2>&1 && (
  dce::install() {
    cd "${1}" || (
      echo "Failed to enter ${1}"
      exit 1
    )
    if [ -n "${PREFIX}" ]; then
      PREFIX="${PREFIX}" make install
    else
      sudo make install
    fi
    cd ..
  }
  dce::clone() {
    git clone "${CLONE_URL-"https://github.com/kornicameister/docker-compose-extra.git"}" \
      --branch "${CLONE_BRANCH-master}" \
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
