#!/usr/bin/env bash

set -e

HOST=$(hostname)

home-manager --flake ".#$USER@$HOST" switch --show-trace
rm -f ~/.cache/tofi-drun
