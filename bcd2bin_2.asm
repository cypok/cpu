data        equ     0x50 
start       equ     0x00

; ------------------------------------
            orig    data
source      con     0x1234  ; INPUT
result      con             ; OUTPUT  (bcd)source to bin


part1       con             ; a
part2       con             ; b
part3       con             ; c
part4       con             ; d

n1000       con     0x1000
n0100       con     0x0100
n0010       con     0x0010
n0001       con     0x0001

ten         con     10

zero        con     0

; ------------------------------------
            orig    start
            
; part1
            lda     source
            div     n1000
            sta     part1

; part2
            lda     source
            mul     n0010
            div     n1000
            sta     part2

; part3
            lda     source
            mul     n0100
            div     n1000
            sta     part3

; part4
            lda     source
            mul     n1000
            div     n1000
            sta     part4

; sum up
            lda     zero
            add     part1     ; a = [1]
            mul     ten       ; a = [1]*10
            add     part2     ; a = [1]*10 + [2]
            mul     ten       ; a = [1]*100 + [2]*10
            add     part3     ; a = [1]*100 + [2]*10 + [3]
            mul     ten       ; a = [1]*1000 + [2]*100 + [3]*10
            add     part4     ; a = [1]*1000 + [2]*100 + [3]*10 + [4]
            sta     result

            lda     result
            hlt
