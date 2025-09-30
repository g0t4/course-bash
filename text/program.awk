# // { print NR, $0  }
# FNR>2 {
#     print NR, $0, FILENAME, FNR
# }

# NR==6 { nextfile }
# { if (NR == 6) nextfile }

NR>2 {
    srand()
    print rand(), NR, $0
}
