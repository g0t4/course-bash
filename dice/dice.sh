#!/usr/bin/env bash
set -euo pipefail

# Defaults (optional)
SIDES=""
ROLLS=""

usage() {
    echo "Usage: $0 --sides <number> --rolls <number>"
    echo
    echo "  --sides   Number of sides per die (e.g. 6)"
    echo "  --rolls   Number of dice to roll (e.g. 3)"
    exit 1
}

# Parse args
while [[ $# -gt 0 ]]; do
    case "$1" in
        --sides)
            SIDES="${2:-}"
            shift 2
            ;;
        --rolls)
            ROLLS="${2:-}"
            shift 2
            ;;
        -h | --help)
            usage
            ;;
        *)
            echo "Unknown option: $1"
            usage
            ;;
    esac
done

# Validate required args
if [[ -z "$SIDES" || -z "$ROLLS" ]]; then
    echo "Error: both --sides and --rolls are required"
    usage
fi

# Validate numbers
if ! [[ "$SIDES" =~ ^[0-9]+$ && "$ROLLS" =~ ^[0-9]+$ ]]; then
    echo "Error: sides and rolls must be positive integers"
    exit 1
fi
