; NullSector - Assembly Signal Module
; Operator: GhostByte
; Mission: Low-level System Call

section .data
    msg db '[!] Signal Sent to 85.111.76.66', 0xa

section .text
    global _start

_start:
    ; Mesajı yazdır (sys_write)
    mov eax, 4          ; system call number (sys_write)
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, msg        ; message to write
    mov edx, 32         ; message length
    int 0x80            ; call kernel

    ; Çıkış (sys_exit)
    mov eax, 1          ; system call number (sys_exit)
    int 0x80
