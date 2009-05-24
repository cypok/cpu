data        equ     0xa0 
start       equ     0x00
error       equ     0xff

; ------------------------------------
            orig    data
source      con     0x1234  ; INPUT
result      con             ; OUTPUT  (bcd)source to bin


part        con
            con
            con
            con

mask        con     0xf000
            con     0x0f00
            con     0x00f0
            con     0x000f

ten         con     10

zero        con     0

; ------------------------------------
            orig    start
            
; part1
            lda     source
            and     mask
            sra     12
            sta     part

            cmp     ten
            je      error
            jg      error

; part2
            lda     source
            and     mask+1
            sra     8
            sta     part+1

            cmp     ten
            je      error
            jg      error

; part3
            lda     source
            and     mask+2
            sra     4
            sta     part+2

            cmp     ten
            je      error
            jg      error

; part4
            lda     source
            and     mask+3
            sta     part+3

            cmp     ten
            je      error
            jg      error

; sum up
            lda     zero
            add     part      ; a = [1]
            mul     ten       ; a = [1]*10
            add     part+1    ; a = [1]*10 + [2]
            mul     ten       ; a = [1]*100 + [2]*10
            add     part+2    ; a = [1]*100 + [2]*10 + [3]
            mul     ten       ; a = [1]*1000 + [2]*100 + [3]*10
            add     part+3    ; a = [1]*1000 + [2]*100 + [3]*10 + [4]

            sta     result

            hlt

            orig    error
            hlt          
