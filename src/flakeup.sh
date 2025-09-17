#! /usr/bin/env bash

FLAKE_PATH="/etc/nixos"
INPUTS=""
TRIMMED_INPUTS=""

while [ $# -gt 0 ]; do
  case "$1" in
    --flake|-f)
      shift
      if [ -z "$1" ]; then
        echo "Error: -f requires an argument"
        exit 1
      fi
      FLAKE_PATH="$1"
      shift
    ;;
    *)
      INPUTS="$INPUTS $1"
      TRIMMED_INPUTS=$(echo "$INPUTS" | xargs)
      shift
    ;;
  esac
done

echo "Updating flake: $FLAKE_PATH"
echo "Inputs: $TRIMMED_INPUTS"
nix flake update "$TRIMMED_INPUTS" --flake "$FLAKE_PATH"
git -C "$FLAKE_PATH" commit -a -m "Update flake inputs"
