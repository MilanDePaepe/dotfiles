#!/bin/bash

workspace="$1"

exec /opt/homebrew/bin/omniwmctl command switch-workspace "$workspace"
