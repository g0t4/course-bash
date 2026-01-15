
#!/usr/bin/env python3
import sys

def is_interactive() -> bool:
    return sys.flags.interactive != 0 or sys.stdin.isatty()

def greet(name: str) -> str:
    return f"Hello, {name}!"

if __name__ == "__main__":
    if is_interactive():
        while True:
            try:
                user_input = input("Enter name (or 'exit'): ")
                if user_input.lower() == "exit":
                    break
                print(greet(user_input))
            except EOFError:
                break
    else:
        # Non‑interactive execution: read name from arguments or stdin
        if len(sys.argv) > 1:
            print(greet(sys.argv[1]))
        else:
            name = sys.stdin.read().strip()
            if name:
                print(greet(name))


