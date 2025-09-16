function help_bat() {
    help "$@" | bat -l help
    help "$1" "$2" "$3" "$4" "$5" | bat -l help
    # echo "1: $1"
    # echo "2: $2"
    # echo "3: $3"
    # echo "4: $4"
    # echo "@: $@"
    # echo "#: $#"
}
