







function adder() {
    echo "count: $#"
    local -i sum=0
    for param in "$@"; do
        echo "word: $param"
        sum+=$param
    done
    echo "sum: $sum"
}
































function show_words() {
    # preserves passed words (no new splitting)
    #  think of this is "show your words"
    for param in "$@"; do
        echo "$param"
    done
}
