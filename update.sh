#!/usr/bin/env bash

set -e

HOST=$(hostname)

nix flake update
nix flake check
. apply-os.sh
. apply-home.sh