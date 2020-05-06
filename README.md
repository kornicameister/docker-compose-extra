![Install](https://github.com/kornicameister/docker-compose-extra/workflows/Install/badge.svg?branch=master&event=push)

# docker-compose-extra
Extends capabilities of docker-compose with extra commands

## Installation

### Via script

```sh
curl -sSL https://git.io/JfZgU | sudo bash /dev/stdin
```

Following method can be customized by setting following enviornmental variables:
- `CLONE_URL` - a url from which to install, might be useful for forks
- `CLONE_DEPTH` - how many commits to fetch, equivalent of `--depth` of `git clone`
- `CLONE_BRANCH`- change if you wish to clone from different branch

### Via checkout

```sh
git clone https://github.com/kornicameister/docker-compose-extra.git --depth 1
cd docker-compose-extra
sudo make install
```

### Customizing

All methods can be customized via setting one or more of following environmntal variables:
- `PREFIX` - where to put binaries, for instance to install under `${HOME}` directory one can do:
  `make install PREFIX=$HOME/.local`
