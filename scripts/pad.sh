echo '$-'="$-"
echo "Mode:" "$([[ $- == *i* ]] && echo interactive || echo non-interactive)"








#exit

if [[ $- == *i* ]]; then
    # interactive shell => prompt user
    read -p "Image file to clean: " image_path
else
    # non-interactive: take first arg
    image_path="$1"
fi

[ -z "$image_path" ] && {
    echo "No image provided"
    exit 1
}

# * add padding to $image_path

mkdir -p mods

# foo.png => foo.padded.png
base="${image_path##*/}"
declare -p base | bat -l bash

base_no_ext="${base%.*}"
declare -p base_no_ext | bat -l bash

ext="${image_path##*.}"
declare -p ext | bat -l bash

new_name="${base_no_ext}.padded.${ext}" # filename modifiers emulated in bash
declare -p new_name | bat -l bash

# assumes 70x70 original size (from sf-symbols export)
# => resize to 100x100
# => 100-70=50
# => 30/2 = 15px left/right/up/down
# => 15px padding
magick "$image_path" -gravity center -background transparent -extent 100x100 "mods/$new_name"
