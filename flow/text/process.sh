if [[ ! -f cpiai.csv ]]; then
    wget 'https://datahub.io/core/cpi-us/_r/-/data/cpiai.csv'
fi

# head cpiai.csv
tail -n +2 cpiai.csv > headerless.csv

head cpiai.csv > top.csv






while read -r line; do
    case $line in
        [[:alpha:]]*) ;;
        [0-9][0-9][0-9][0-9]*) ;;
        *) echo "PROBLEM: $line" ;;
    esac
done <modified.csv
