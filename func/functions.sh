function help_bat() {
    # help "$1" | bat -l help
    echo "1: $1"
    echo "2: $2"
    echo "3: $3"
    echo "4: $4"
    echo "@: $@"
    echo "#: $#"
}
