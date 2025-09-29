
BEGIN {
    OFS=": "
    ORS="<-->"

    for (_name in SYMTAB) {
        type = typeof(SYMTAB[_name])
        if(type == "array"){
            print(_name, type)
            continue
        }
        print(_name, type, SYMTAB[_name])
    }
}


