echo "## Welcome to Wes's cleanup script!"
echo

read -rp "What needs to be organized? " response

(set -x; ls $response; ls "$response")
