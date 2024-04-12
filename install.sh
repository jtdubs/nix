#!/usr/bin/env bash

set -e

HOST=$1

if [ -z "$HOST" ]
then
    echo "usage: ./install.sh [HOST]"
    exit 1
fi

CURRENT_HOST=$(hostname)
if [ "$HOST" = "$CURRENT_HOST" ]
then
    echo "already installed; use ./update.sh instead."
    exit 1
fi

echo Formatting disks...
sudo nix \
  --experimental-features "nix-command flakes" \
  run github:nix-community/disko               \
  --                                           \
  --mode disko                                 \
  ./hosts/$HOST/disks.nix

echo Installing NixOS...
sudo nixos-install --flake ".#$HOST"
