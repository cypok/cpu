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

d1000       con     1000
d0100       con     100
d0010       con     10
d0001       con     1

var         con
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

; zero result
            lda     zero
            sta     result

; part1 * 1000
            lda     zero
            sta     var       ; var = 0
            lda     part1     ; a = [1]
            mul     d1000     ; a = [1]*1000
            sta     var       ; var = [1]*1000
            lda     result
            add     var       ; result += [1]*1000
            sta     result

; part2 * 100
            lda     zero
            sta     var       ; var = 0
            lda     part2     ; a = [2]
            mul     d0100      ; a = [2]*100
            sta     var       ; var = [2]*100
            lda     result
            add     var       ; result += [2]*100
            sta     result

; part3 * 10
            lda     zero
            sta     var       ; var = 0
            lda     part3     ; a = [3]
            mul     d0010       ; a = [3]*10
            sta     var       ; var = [3]*10
            lda     result
            add     var       ; result += [3]*10
            sta     result

; part1 * 1000
            lda     zero
            sta     var       ; var = 0
            lda     part4     ; a = [4]
            mul     d0001        ; a = [4]*1
            sta     var       ; var = [4]*1
            lda     result
            add     var       ; result += [4]*1
            sta     result

            lda     result
            hlt
