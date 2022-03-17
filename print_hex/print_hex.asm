
[org 0x7c00]
    mov dx, 0x1ff6
    call print_hex

    jmp $

    %include "print_string.asm"

print_hex:
    mov bx, HEX_OUT
    add bx, 5
    mov ax, dx
print_hex_loop:
    mov dx, ax
    and dx, 0xf
    cmp byte[bx], 'x'
    je print_hex_final
    cmp dl, 9
    jg print_hex_letra

print_hex_numero:
    mov cl, 48
    add cl, dl
    mov byte[bx], cl
    sub bx, 1
    shr ax, 4
    jmp print_hex_loop

print_hex_letra:
    mov cl, 87
    add cl, dl
    mov byte[bx], cl
    sub bx, 1
    shr ax, 4
    jmp print_hex_loop

print_hex_final:
    mov bx, HEX_OUT
    call print_string
    ret

HEX_OUT: db '0x0000',0

COUNTER_AUX: db 00000000

    times 510-($-$$) db 0
    dw 0xaa55