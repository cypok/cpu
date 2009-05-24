data        equ     0x50 
start       equ     0x00


; ------------------------------------
            orig    data

num         con     0x1234
two         con     0x0002
mask        con     0x0f0f
            con     0x5050

; ------------------------------------
            orig    start

            lda     num     ; a = 1234
            sla     4       ; a = 2340
            sra     8       ; a = 0023
            hlt
