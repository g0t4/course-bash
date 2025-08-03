target=$((RANDOM % 10))

echo "target: $target"
echo

echo "Guess a number from 0 to 9, type 'stop' to exit!"
i=1
until read -p "guess $i: " guess && [[ "$guess" == "stop" ]]; do
    
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


