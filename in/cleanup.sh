echo "## Welcome to Wes's cleanup script!"
echo

# make sure to leave space after? so the response is separate for  the user!
read -rp "What needs to be organized? " response

# leave off "" so I can cover pathname/glob expansion
#   add "" to stop pathname expansion as second demo (if time permits)
(
    set -x
    ls $response
)

(
    set -x
    ls "$response"
)
