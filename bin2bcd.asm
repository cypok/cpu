data        equ     0xa0 
start       equ     0x00
error       equ     0xff

; ------------------------------------
            orig    data
source      con     0x270f  ; INPUT
result      con             ; OUTPUT  (bin)source to bcd

var         con     

ten         con     10
hundred     con     100
thousand    con     1000

zero        con     0

max         con     9

; ------------------------------------
; A = abcd
            orig    start
          
; thousands
            lda     source      ; A = abcd
            div     thousand    ; A = 0xa
            cmp     max
            jg      error       ; error if a > 9

            sta     var         ; var = a
            sla     12          ; A = 0xa000
            sta     result      ; res = 0xa000

            lda     var         ; A = var
            mul     thousand    ; A = a000
            sta     var         ; var = a000

            lda     source      ; A = abcd
            sub     var         ; A = 0bcd

; hundreds
            sta     source      ; source = 0bcd
            div     hundred     ; A = 0xb

            sta     var         ; var = b
            sla     8           ; A = 0x0b00
            add     result      ; A = 0xab00
            sta     result      ; res = 0xab00

            lda     var         ; A = b
            mul     hundred     ; A = 0b00
            sta     var         ; var = 0b00

            lda     source      ; A = 0bcd
            sub     var         ; A = 00cd

; tens
            sta     source      ; source = 00cd
            div     ten         ; A = 0xc

            sta     var         ; var = c
            sla     4           ; A = 0x00c0
            add     result      ; A = 0xabc0
            sta     result      ; res = 0xabc0

            lda     var         ; A = c
            mul     ten         ; A = 00c0
            sta     var         ; var = 00c0

            lda     source      ; A = 00cd
            sub     var         ; A = 000d

; units
            sta     var         ; var = 000d

            add     result      ; A = 0xabcd

            sta     result      ; res = 0xabcd

            hlt

            orig    error
            hlt          
