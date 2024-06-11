#!/usr/bin/env python3

def dump_file_to_hex_string(file_path):
    # read the file in binary mode
    with open(file_path, "rb") as f:
        # Read the entire file
        file_content = f.read()
    
    # convert the file content to a list of hex values with two characters
    hex_values = [format(byte, '02x') for byte in file_content]
    
    # construct the string with the hex values
    hex_string = "[ " + ", ".join("0x" + hex_value for hex_value in hex_values) + " ]"
    
    return hex_string

def write_hex_string_to_file(hex_string, output_file):
    with open(output_file, "w") as f:
        f.write("let shellcode = " + hex_string)

file_path = "shellcode.bin"
output_file = "dump.txt"
hex_string = dump_file_to_hex_string(file_path)
write_hex_string_to_file(hex_string, output_file)
print("output file written to", output_file)
