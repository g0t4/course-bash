target=$((RANDOM % 10))

echo "target: $target"
echo

echo "Guess a number from 0 to 9, three tries!"
i=1
while (( i <= 3 )); do
    read -p "guess $i: " guess

    if ! [[ $guess =~ ^[0-9]$ ]]; then
        echo "Please enter a single digit number!"
        continue
    fi

    if ((guess == target)); then
        echo "CONGRATULATIONS! $target is the right number!"
        break
    fi
    echo "Nope!"
    ((i++))
done


