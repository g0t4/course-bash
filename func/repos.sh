function is_git_repo {
    # ignore STDOUT/STDERR if git is missing OR not in work tree (repo)
    git rev-parse --is-inside-work-tree 1>/dev/null 2>&1
}

function is_hg_repo {
    # ignore STDOUT/STDERR if hg command is missing OR not in hg repo
    hg root >/dev/null 2>&1
}

function git_repo_root {
    git rev-parse --show-toplevel 2>/dev/null
    # return 0
}

function hg_repo_root {
    hg root 2>/dev/null
}

function _repo_root() {

    if is_git_repo; then
        git_repo_root
    elif is_hg_repo; then
        hg_repo_root
    else
        # warn over STDERR (that way, cd $(_repo_root) still works)
        echo "cannot find repo root" >&2
        builtin pwd
    fi
}

alias cdr='cd "$(_repo_root)"'
