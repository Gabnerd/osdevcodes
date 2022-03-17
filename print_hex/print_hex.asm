
[org 0x7c00]
    mov dx, 0x1fb6
    call print_hex

    jmp $

    %include "print_string.asm"

print_hex:
    mov bx, HEX_OUT
    add bx, 2
    shr dx, 8;problema
    and dx, 0xf
print_hex_loop:
    cmp byte[bx], 0
    je print_hex_final
    cmp dl, 9
    jg print_hex_letra

print_hex_numero:
    mov cl, 48
    add cl, dl
    mov byte[bx], cl
    add bx, 1
    jmp print_hex_loop

print_hex_letra:
    mov cx, 87
    add cx, dx
    mov byte[bx], cl
    add bx, 1
    jmp print_hex_loop

print_hex_final:
    mov bx, HEX_OUT
    call print_string
    ret

HEX_OUT: db '0x0000',0

    times 510-($-$$) db 0
    dw 0xaa55