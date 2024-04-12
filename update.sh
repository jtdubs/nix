#!/usr/bin/env bash

set -e

HOST=$(hostname)

nix flake update
nix flake check
sudo nixos-rebuild --flake ".#$HOST" switch
