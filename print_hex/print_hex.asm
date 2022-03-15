
[org 0x7c00]
    mov dx, 0x1fb6
    call print_hex

    jmp $

    %include "print_string.asm"

print_hex:
    mov cx, HEX_OUT

print_hex_loop:
    cmp cx, 0
    je print_hex_final
    ;wtf i need put here?
    add cx, 1
    jmp print_hex_loop
    
print_hex_final:
    mov bx, HEX_OUT
    call print_string
    ret

HEX_OUT: db '0x0000',0

    times 510-($-$$) db 0
    dw 0xaa55