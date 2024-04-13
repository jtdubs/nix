#!/usr/bin/env bash

set -e

HOST=$(hostname)

sudo nixos-rebuild --flake ".#$HOST" switch
home-manager --flake ".#$USER@$HOST" switch
