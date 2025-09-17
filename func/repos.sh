function is_git_repo {
    # suppress STDOUT/STDERR
    # use exit status to communicate success/failure
    git rev-parse --is-inside-work-tree 1>/dev/null 2>&1
}

function is_hg_repo {
    # suppress STDOUT/STDERR
    # use exit status to communicate success/failure
    hg root >/dev/null 2>&1
}

function git_repo_root {
    # suppress STDERR
    # preserve STDOUT (repo path)
    git rev-parse --show-toplevel 2>/dev/null
    # return 0
}

function hg_repo_root {
    # suppress STDERR
    # preserve STDOUT (repo path)
    hg root 2>/dev/null
}

function _repo_root() {

    if is_git_repo; then
        git_repo_root # STDOUT
    elif is_hg_repo; then
        hg_repo_root # STDOUT
    else
        echo "cannot find repo root" >&2 # STDERR, so cd $(_repo_root) still works
        builtin pwd                      # STDOUT
    fi
}

alias cdr='cd "$(_repo_root)"'
# (set -x; cd "$(_repo_root)" )
