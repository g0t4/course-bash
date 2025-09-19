BEGIN {
    RS="======\n";
    FS="\n"

    print("CONF:")
}

{
    print "record:" NR
    for (i = 1; i < NF; i++) {

        print "  field:" i

        n = split($i, parts, "=")
        print("    " n, parts[1], parts[2])
    }

    # print("  - RE: " vars["regexp"])
    # print("    COLORS: " vars["colours"])
}


