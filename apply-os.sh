#!/usr/bin/env bash

set -e

HOST=$(hostname)

sudo nixos-rebuild --flake ".#$HOST" switch
