#!/usr/bin/env python3

import sys
def main():
    parsing_active = False

    try:
        for line in sys.stdin:
            line = line.rstrip()

            if line == "Test failures:":
                parsing_active = True
                continue

            if not parsing_active:
                continue

            if line.startswith("=== "):
                print("\n")
                print(line)
            elif line.startswith("FAIL ["):
                print(line)
            elif line.startswith("engine.CloseServer has beeen called!"):
                return

    except Exception as e:
        print(f"Python script error: {e}")

if __name__ == "__main__":
    main()

