target=$((RANDOM % 10))

echo "target: $target"
echo

echo "Guess a number from 0 to 9, three tries!"
for ((i = 1; i <= 3; i++)); do
    read -p "guess $i: " guess

    if ! [[ $guess =~ ^[0-9]$ ]]; then
        echo "Please enter a single digit number!"
        ((i--)) # allow retry
        continue
    fi

    if ((guess == target)); then
        echo "CONGRATULATIONS! $target is the right number!"
        break
    fi
done


