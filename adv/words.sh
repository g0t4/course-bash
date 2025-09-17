







function adder() {
    echo "count: $#"
    local -i sum=0
    for param in "$@"; do
        echo "word: $param"

        # FYI, sum is not the point of this demo:
        sum+=$param
    done
    echo "sum: $sum"
}
































function show_words() {
    # declare -p IFS | bat -l bash
    # preserves passed words (no new splitting)
    #  think of this is "show your words"
    for param in "$@"; do
        echo "$param"
    done
}
