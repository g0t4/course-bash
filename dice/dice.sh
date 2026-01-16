#!/usr/bin/env bash

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

for ((roll = 1; roll <= $ROLLS; roll++)); do
    number=$((RANDOM % SIDES + 1))
    echo "roll $roll landed on: " $number
done
