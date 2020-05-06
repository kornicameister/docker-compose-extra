#!/usr/bin/env bash

### adapted from wonderful: https://github.com/tj/git-extras/blob/master/install.sh

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

if command -v git >/dev/null 2>&1; then
  dir="$(mktemp -t -d dce-install.XXXXXXXXXX)"
  pwd="${PWD}"

  cd "${dir}" &&
    echo "Setting up 'docker-compose-extra'" &&
    dce::clone "${PWD}/dce" &&
    dce::install "${PWD}/dce" &&
    cd "${pwd}" || exit 2

  rm -rf "$dir"
  exit 0
else
  echo "git is required to install like that"
  exit 1
fi
