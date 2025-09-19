
# NR>2 {
#     print rand(), NR, $0
# }



# NR>2 {
#     srand(1)
#     print rand(), NR, $0
# }



# NR==1 { srand(1) }
# NR>2 {
#     print rand(), NR, $0
# }




# NR==1 {
#     # srand()
#     srand(systime())
# }
# NR>2 {
#     print rand(), NR, $0
# }



BEGIN {
    seed = systime()
    # print(seed)
    srand(seed)
}

NR>2 {
    print rand(), NR, $0
}




