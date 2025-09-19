# // { print NR, $0 }
# NR>2 { print NR, $0, FILENAME, FNR }

# NR==6  { nextfile }
# { if( NR == 6 ) nextfile }

NR>2 { 
    print NR, $0, FILENAME, FNR 
}


