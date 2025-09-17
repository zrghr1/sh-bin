#! /usr/bin/env bash

FLAKE_PATH="/etc/nixos"
OPERATION="switch"

while [ $# -gt 0 ]; do
  case "$1" in
    --flake|-f)
      shift
      if [ -z "$1" ]; then
        echo "Error: -f requires an argument"
        exit 1
      fi
      FLAKE_PATH="/etc/nixos#$1"
      shift
    ;;
    --dry|-d)
      echo "rebuilding dry..."
      OPERATION="dry-run"
      shift
    ;;
  esac
done

exec sudo nixos-rebuild "$OPERATION" --flake "$FLAKE_PATH"
