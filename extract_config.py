def process_file(filename):
    with open(filename, 'r') as file:
        for line in file:
            line = line.strip()
            if line.startswith("#define"):
                parts = line.split(maxsplit=2)
                if len(parts) == 3:
                    name, value = parts[1], parts[2]
                    print(f".{name} = {value},")
            elif line.startswith("# define"):
                parts = line.split(maxsplit=3)
                if len(parts) == 4:
                    name, value = parts[2], parts[3]
                    print(f".{name} = {value},")
            elif line.startswith("/* #undef"):
                parts = line.split(maxsplit=4)
                if len(parts) > 3:
                    name = parts[2]
                    print(f".{name} = null,")

# Usage
# process_file('your_file.txt')
process_file('config.h')
