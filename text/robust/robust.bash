#!/usr/bin/env bash
# Usage: ./robust_example.sh <source_dir> [pattern]
# Example: ./robust_example.sh ./data "*.txt"

# set -Eeuo pipefail

DEBUG=${DEBUG:-0}
if (( DEBUG )); then
  # PS4='+ ${BASH_SOURCE}:${LINENO}: '
  set -x
fi

LOG_FILE=${LOG_FILE:-"./example.log"}
log() { printf '%s %s\n' "$(date +"%Y-%m-%dT%H:%M:%SZ")" "$*" | tee -a "$LOG_FILE" >&2; }
die() { log "ERROR: $*"; exit 1; }

cleanup() {
  local exit_code=$?
  if [[ ${work_dir-} && -d ${work_dir-} ]]; then rm -rf "$work_dir"; fi
  [[ $exit_code -eq 0 ]] && log "SUCCESS" || log "FAILED (exit $exit_code)"
}
# trap cleanup EXIT
# trap 'die "Interrupted (SIGINT)"' INT
# trap 'die "Command failed at line $LINENO: $BASH_COMMAND"' ERR

main() {
  # log "Starting: $0"
  local source_dir=${1:-} pattern=${2:-*.txt}
  [[ -n $source_dir ]] || die "Usage: $0 <source_dir> [pattern]"
  [[ -d $source_dir ]] || die "Source directory not found: $source_dir"

  work_dir="$(mktemp -d)"
  log "Working directory: $work_dir"

  mapfile -t files < <(find "$source_dir" -type f -name "$pattern" -print)
  (( ${#files[@]} )) || die "No files match pattern: $pattern"

  for file in "${files[@]}"; do
    cp -v -- "$file" "$work_dir"/ | tee -a "$LOG_FILE" >&2
  done

  log "Processed ${#files[@]} files."
}

main "$@"
