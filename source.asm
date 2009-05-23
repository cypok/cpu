data        equ     0x50 
start       equ     0x00

            orig    data
            con     0x090a
            con     0x0000
            con     0x1111
num         con     0x1234
m_1000      con     0xf000
m_1010      con     0xf0f0
m_0011      con     0x00ff
m_0001      con     0x000f
two         con     0x0002
one         con     0x0100

            orig    start
;            nop     2*2+4+data

;            lda     data        ; A = 0x090a
;            add     data+2      ; A = 0x1a1b
;
;            sta     data+1      ; [data+1] = 0x1a1b
;            lda     data        ; A = 0x090a
;            add     data+2      ; A = 0xf7f9 and OF = 1

            lda     num         ; A = 0x1234
            add     num-1
            sub     num-1
            mul     two
            div     one

;            lda     num         ; A = 0x1234
;            and     m_1010      ; A = 0x1030
;
;            lda     num         ; A = 0x1234
;            or      m_0011      ; A = 0x12ff

            hlt

            orig    0xf0
of_hlt      hlt
not_of_hlt  hlt

