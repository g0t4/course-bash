
BEGIN {
    for (_name in SYMTAB) {
        if(typeof(SYMTAB[_name]) == "array"){
            print(_name, "array");
            continue
        }
        print(_name,  SYMTAB[_name])
    }
}


