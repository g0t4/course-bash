#!/usr/bin/env bash

demo_files_with_space() {
  mkdir -p demo
  touch "demo/file with space.txt" "demo/normal.txt"

  echo "Default IFS (space/tab/newline):"
  for f in $(ls demo); do   # BAD: unquoted, splits on spaces
    echo "[$f]"
  done

  echo
  echo "glob:"
  for f in demo/*; do       # GLOB gives array of filenames
    echo "[$f]"
  done

  echo
  echo "override IFS=\$'\\n\\t':"
  IFS=$'\n\t'
  for f in $(ls demo); do   # still BAD, but spaces don’t split anymore
    echo "[$f]"
  done

  rm -rf demo
}

