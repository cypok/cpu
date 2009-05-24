data        equ     0xa0 
start       equ     0x00

; ------------------------------------
            orig    data

n37         con     0x0037
n15         con     0x0015
n40         con     0x0040

; ------------------------------------
            orig    start

            lda     n37
g_step      cmp     n15     
            jl      error
            je      error
            jg      e_step
            jmp     error

e_step      cmp     n37     
            jl      error
            jg      error
            je      l_step
            jmp     error

l_step      cmp     n40     
            jg      error
            je      error
            jl      finish
            jmp     error

finish      hlt            

            orig    0xff
error       hlt
