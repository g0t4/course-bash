BEGIN {
    RS="======\n";
    FS="\n" 

    print("CONF:")
} 

{
    # print NR, $0
    n = split($1, parts, "=")
    # print(n, parts[1], parts[2])
    vars[parts[1]] = parts[2]

    n = split($2, parts, "=")
    # print(n, parts[1], parts[2])
    vars[parts[1]] = parts[2]

    print("  - RE: " vars["regexp"])
    print("    COLORS: " vars["colours"])
}


