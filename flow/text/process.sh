if [[ ! -f cpiai.csv ]]; then
    wget 'https://datahub.io/core/cpi-us/_r/-/data/cpiai.csv'
fi

# head cpiai.csv
tail -n +2 cpiai.csv > headerless.csv

head cpiai.csv > top.csv

while read -r line; do
    echo "$line"
done <top.csv
