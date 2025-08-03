target=$((RANDOM % 10))

echo "target: $target"
echo

echo "Guess a number from 0 to 9, three tries!"
for ((i = 1; i <= 3; i++)); do
    read -p "guess $i: " guess

    if ((guess == target)); then
        echo "CONGRATULATIONS! $target is the right number!"
    fi
done


