#!/bin/bash

set -e
set -x

echo Formatting disks...
sudo nix \
  --experimental-features "nix-command flakes" \
  run github:nix-community/disko               \
  --                                           \
  --mode disko                                 \
  ./hosts/decl/disks.nix

echo Installing NixOS...
sudo nixos-install --flake .#decl
