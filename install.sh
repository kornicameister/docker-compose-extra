#!/usr/bin/env bash

### adapted from wonderful: https://github.com/tj/git-extras/blob/master/install.sh

dce::install() {
    if [ -n "${PREFIX}" ]; then
        PREFIX="${PREFIX}" make -i "${1}" install
    else
        sudo make -i "${1}" install
    fi
}
dec::clone() {
  git clone "${CLONE_URL-"https://github.com/kornicameister/docker-compose-extra.git"}"  \
    --depth "${CLONE_DEPTH-10}" \
    dce &> /dev/null
}

dir="$(mktemp -t -d dce-install.XXXXXXXXXX)"
pwd="${PWD}"

cd "${dir}" && \
  echo "Setting up 'git-extras'...." && \
  dce:clone && \
  make_install "${PWD}/dce" && \
  cd "${pwd}" || exit 2

rm -rf "$dir"
