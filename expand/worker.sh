function worker() {
    echo "start$1" >&2
    sleep $1
    echo "done$1" >&2
}
