import itertools
import sys

if len(sys.argv) < 2:
    print("missing repeat argument")
    sys.exit()

text="abcdefghijklmnopqrstuvwxyz0123456789"

#print(text)
#print(text.split(""))

for perm in itertools.product(list(text), repeat=int(sys.argv[1])):
    print("".join(perm) + ".no")

