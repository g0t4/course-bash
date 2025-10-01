# // { print NR, $0  }
# FNR>2 {
#     print NR, $0, FILENAME, FNR
# }

# NR==6 { nextfile }
# { if (NR == 6) nextfile }

NR==1 { srand() }

NR>2 {
    print rand(), NR, $0
}
