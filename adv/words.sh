function show_words() {
    # preserves passed words (no new splitting)
    #  think of this is "show your words"
    for param in "$@"; do
        echo "$param"
    done
}
