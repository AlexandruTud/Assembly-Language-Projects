;primele 25 de numbere din Sirul lui Fibonacci
;proiect Tudor Vladut-Alexandru grupa 5 Informatica

.model  tiny,c
        .code
        org     0100h                   ;îi spune asamblatorului să asambleze tot codul următor începând cu adresa 0100h
main    proc    far
        sub     sp,16                   ;alocam spatiu pentru sir
        mov     bp,sp                   ;copiem instructiunea din sp in bp
        mov     byte ptr 5[bp],00dh     ;bp[5] = 00d,00a,'$' - terminator de sir
        mov     byte ptr 6[bp],00ah     ;anunta assembler-ul că stocam un octet
        mov     byte ptr 7[bp],024h
        mov     di,0ffffh               ;fib(-2) , înseamnă încărcarea registrului di cu conținutul locației de memorie 0ffffh.
        mov     si,00001h               ;fib(-1) , înseamnă încărcarea registrului si cu conținutul locației de memorie 00001h 
        mov     cx,25                   ;loop: fib(0) to fib(24) ,conținutul instrucțiunii 25 este mutat în cx.
        mov     bx,10                   ;pentru a converti in sir, conținutul instrucțiunii 10 este mutat în bx.
main0:  xchg    si,di                   ;fib step, xchg stochează doar un element
        add     si,di                   ;adunam cei doi operanti
        mov     bp,sp                   ;display si
        add     bp,5
        mov     ax,si                   ;ax este folosit pentru opreatii aritmetice
main1:  dec     bp
        xor     dx,dx                   ;setam un registru la 0
        div     bx                      ;divide cu bx
        or      dl,030h                 
        mov     [bp],dl
        cmp     bp,sp                   ;comparam sp cu bp
        jne     main1                   ;un salt care urmareste un test
        mov     ah,009h
        mov     dx,sp
        int     21h                     ;introduce caractere de la tastatură si trimite caractere pe ecran
        loop    main0                   ;se repeta pana cand e gata
        add     sp,16                   ;restore sp
        mov     ax,04c00h               ;exit
        int     21h
main    endp
        end     main