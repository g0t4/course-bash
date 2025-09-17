function _repo_root() {

    if git rev-parse --is-inside-work-tree 1>/dev/null 2>&1; then
        # ignore STDOUT/STDERR if git is missing OR not in work tree (repo)
        git rev-parse --show-toplevel 2>/dev/null
    elif hg root >/dev/null 2>&1; then
        # ignore STDOUT/STDERR if hg command is missing OR not in hg repo
        hg root 2>/dev/null
    else
        # warn over STDERR (that way, cd $(_repo_root) still works)
        echo "cannot find repo root" >&2
        builtin pwd
    fi
}

alias cdr='cd "$(_repo_root)"'
