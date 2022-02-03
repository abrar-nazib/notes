# Binary Explpoitation

## Links

[Basics](http://phrack.org/issues/49/14.html)

## GDB commands

```bash
gdb binary_filename
    # starts gdb on the compiled file
disassemble function_name
    # dis assembles the compiled file's function specified
    # mostly main function is dis assembled
set disassemble-flavor intel
    # makes the dis assembled code a little bit pretty(? will know much later)
```

## Exploitation technique

- `python -c 'import struct;print "A"*44 + struct.pack("<I",target-address)'`
