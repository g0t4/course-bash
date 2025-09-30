# // { print NR, $0  }
FNR>2 {
    print NR, $0, FILENAME, FNR
}

NR==6 { nextfile }

