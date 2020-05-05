#!/usr/bin/env sh

command -v docker >/dev/null 2>&1 || (
  echo "require docker"
  exit 1
)
command -v docker-compose >/dev/null 2>&1 || (
  echo "require docker-compose"
  exit 1
)
