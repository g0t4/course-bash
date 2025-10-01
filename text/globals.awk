BEGIN {
    for (name in SYMTAB) {
        if (isarray(SYMTAB[name])) {
            print(name ": array")
            continue
        }
        print(name ": " SYMTAB[name])
    }
}
