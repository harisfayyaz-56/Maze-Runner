[org 0x0100]
jmp start
dir: db ' '
msge: db 'START'
namee: db 'PLAYER NAME:'
name: db 'HARIS FAYYAZ'
leng: dw 12
sc: db 'SCORE:'
liv: db 'LIVES: '
livc: db 3
tm: db 'TIME:'
winn: db 'CONGRATULATIONS!'
	  db 'YOU WON'
over: db 'GAME OVER'
timee: db 'TIME OVER'
randNum: db 0
score: dw 0
count: db 10
part: db 'M.HARIS FAYYAZ 23L-0767'
parte: db 'BISSAM IFTIKHAR 23L-0913'
exitt: db 'EXITING PROGRAM'
supermanmode: db 'SUPERMAN MODE'
			  db 'ACTIVATED'
num: dw 0
loc: dw 0
load: db 'LOADING'
len1: db 7
tickticks: dw   546
supcount: dw   180
supc1: dw 180
supvar: db 0
supcounter: db 0
counter: dw 0
chan: db 0
playerr: dw 0x03EA
playerpos: dw 0
clrscrn:
	push es
	push ax
	push di
	mov ax,0xb800
	mov es,ax
	mov di,0
	mov cx, 2000
	mov ax, 0x0720
	cld
	rep stosw
	pop di
	pop ax
	pop es
	ret

pos:
	push bp
	mov bp, sp
	pusha
	mov di, 0
	mov ax, [playerr]
	mov cx, 2000
	find:
		mov bx, [es:di]
		cmp bx, ax
		jz update
		add di, 2
		loop find
		jmp termin
		
	update:
		mov word[playerpos], di
	
	termin:
		popa
		mov sp, bp
		pop bp
		ret
		
sidemenu:
	push bp
	mov bp, sp
	mov ax,0xb800
	mov es,ax
	mov di, 110
	mov cx, 25
	mov dx, 25
	mov ax, 0x7720
	strt:
		cld
		rep stosw
		dec dx
		cmp dx, 0
		jz endd
		mov cx, 25
		add di, 110
		jmp strt
	endd:
		mov si, 0
		mov di, 2
		mov cx, 5
		mov ah, 0x06
		mov bx, msge
		msgg:
			mov al, [bx+si]
			mov [es:di], ax
			add di, 2
			inc si
			loop msgg
			mov bx, namee
			mov si, 0
			mov di, 280
			mov cx, 12
			mov ah, 0x70
		pri:
			mov al, [bx+si]
			mov [es:di], ax
			inc si
			add di, 2
			loop pri
			mov bx, name
			mov si, 0
			mov di, 440
			mov cx, [leng]
			mov ah, 0x70
			prii:
			mov al, [bx+si]
			mov [es:di], ax
			inc si
			add di, 2
			loop prii
			
			mov bx, sc
			mov si, 0
			mov di, 760
			
			mov word[es:934], 0x7030
			mov cx, 6
			mov ah, 0x70
			priii:
			mov al, [bx+si]
			mov [es:di], ax
			inc si
			add di, 2
			loop priii
			
			mov bx, liv
			mov si, 0
			mov di, 1400
			mov cx, 7
			mov ah, 0x70
			priui:
			mov al, [bx+si]
			mov [es:di], ax
			inc si
			add di, 2
			loop priui
			;1414 LIVES
			mov word[es:di], 0xF42A
			mov word[es:di+2], 0xF42A
			mov word[es:di+4], 0xF42A
			
			mov bx, tm
			mov si, 0
			mov di, 1880
			mov cx, 5
			mov ah, 0x70
			priuui:
			mov al, [bx+si]
			mov [es:di], ax
			inc si
			add di, 2
			loop priuui
		mov sp, bp
		pop bp
		ret
delay:
push cx
mov cx, 2 ; change the values to increase delay tim
delay_loop1:
push cx
mov cx, 0xFFFF
delay_loop2:
loop delay_loop2
pop cx
loop delay_loop1
pop cx
ret

yeay:
		push bp
		mov bp, sp
		push cs
		pop ds
		mov byte[supvar], 1
		mov bx, winn
		mov di, 2358  ;2360
		mov si, 0
		mov cx, 16
		mov ah, 0x03
		winnn:
			mov al, [bx+si]
			mov [es:di], ax
			add di, 2
			inc si
			loop winnn
			
		mov cx, 7
		add di, 138  ;2524
		wen: 	
			mov al, [bx+si]
			mov [es:di], ax
			add di, 2
			inc si
			loop wen
			
	mov sp, bp
	pop bp
	ret

GenRandNum:
	push bp
	mov bp,sp;
	push cx
	push ax
	push dx;

	MOV AH, 00h ; interrupts to get system time
	INT 1AH ; CX:DX now hold number of clock ticks since midnight
	mov ax, dx
	xor dx, dx
	mov cx, 80;
	div cx ; here dx contains the remainder of the division
	;from 0 to 9
	add dl, '0' ; to ascii from '0' to '9'
	and dx, 3
	mov word[randNum], dx;

	pop cx;
	pop ax;
	pop dx;
	pop bp;
	ret

maze1:
		call sidemenu
		push bp
		mov bp, sp
		xor ax, ax
		xor cx, cx
		xor di, di
		xor si, si
		xor bx, bx
		xor dx, dx
		mov ax, 0xb800
		mov es, ax
		mov ds, ax
		mov ax, 0x4720
		mov di, 1130
		mov cx, 6
	mid11:
		mov [es:di], ax
		add di, 4
		loop mid11
		mov [es:1624], ax
		mov [es:1626], ax
		mov [es:1628], ax
		mov [es:1944], ax
		mov [es:1946], ax
		mov [es:1948], ax
		mov [es:1950], ax
		mov [es:1952], ax
		mov [es:1954], ax
		mov [es:2264], ax
		mov [es:2266], ax
		mov [es:2268], ax
		mov [es:2270], ax
		mov [es:2272], ax
		mov [es:2274], ax
		mov [es:2276], ax
		mov [es:2278], ax
		mov [es:2280], ax
		mov [es:3234], ax
		mov [es:3074], ax
		mov di, 2914
		mov cx, 8
	dre:
		mov [es:di], ax
		sub di, 2
		loop dre
		mov cx, 52
		mov si, 324
	upper:
		mov [es:si], ax
		mov [es:si+3520], ax
		add si, 2
		loop upper
		mov cx, 23
		mov di, 322
	side1:
		mov [es:di], ax
		mov [es:di+106], ax
		add di, 160
		loop side1
		
		mov si, 3850
		mov cx, 16
	inleft:
		mov [es:si], ax
		sub si, 160
		loop inleft
		push si
		sub si, 480
		mov di, si
		mov cx, 24
	inup1:
		mov [es:di], ax
		add di, 2
		loop inup1
		pop si
		sub di, 16
		mov cx, 8
	inup12:
		mov [es:di], ax
		add di, 160
		loop inup12
		sub di, 158
		mov cx, 14
	inup123:
		mov [es:di], ax
		add di, 2
		loop inup123
		sub di, 162
		mov [es:di], ax
		mov [es:di-160], ax
		mov [es:di-320], ax
		sub di, 320
		mov dx, di
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		mov [es:di+8], ax
		mov [es:di+10], ax
		push di
		sub di, 164
		mov cx, 6
	inupm:
		mov [es:di], ax
		sub di, 160
		loop inupm
		pop di
		mov cx, 7
	inupl1:
		mov [es:di-2], ax
		sub di, 2
		loop inupl1
		mov di, dx
		add di, 12
		mov cx, 7
	indown1:
		mov [es:di], ax
		add di, 160
		loop indown1
		mov cx, 6
	inleft1:
		mov [es:si+162], ax
		add si, 2
		loop inleft1

		mov si, 1462
		mov cx, 7
	inl1:
		mov [es:si], ax
		add si, 160
		loop inl1
		mov [es:si+180], ax
		mov cx, 24
	inl12:
		mov [es:si], ax
		add si, 2
		loop inl12
		add si, 478
		mov dx, si
		mov cx, 5
	inl123:
		mov [es:si], ax
		add si, 160
		loop inl123
		mov cx, 5
		mov di, 3862
	inl2:
		mov [es:di], ax
		sub di, 160
		loop inl2
		add di, 320
		mov cx, 16
	inl3:
		mov [es:di], ax
		add di, 2
		loop inl3
		mov [es:di-162], ax
		mov [es:di-322], ax
		
		mov si, dx
		mov cx, 14
		push si
		add si, 28
		mov di, si
		pop si
	inl4:
		mov [es:si], ax
		mov [es:di], ax
		sub di, 160
		add si, 2
		loop inl4
		mov cx, 10
	inl5:
		mov [es:di+160], ax
		sub di, 2
		loop inl5
		
		mov di, 1774
		mov cx, 5
	ene:
		mov [es:di], ax
		mov [es:di+2], ax
		mov [es:di+4], ax
		add di, 160
		loop ene
		
		mov di, 742
		mov cx, 16
	enemm:
		mov [es:di], ax
		sub di, 2
		loop enemm
		mov [es:di+32+160], ax
		mov [es:di+32+320], ax
		mov [es:di+32+322], ax
		mov [es:di+32+324], ax
		mov word[es:di+32+164], 0xF154   ;Treasure
		mov word[es:1668], 0xF154
		mov di, 1684
		mov cx, 4
	enr:
		mov [es:di], ax
		add di, 2
		loop enr
		add di, 312
		mov [es:di], ax
		mov [es:di+2], ax
		mov [es:di+320], ax
		mov [es:di+322], ax
		mov [es:di+324], ax
		mov [es:di+326], ax
		mov di, 3466
		mov cx, 16
	hehe:
		mov [es:di], ax
		mov [es:di+160], ax
		sub di, 2
		loop hehe
		mov di, 3438
		mov cx, 8
	haha:
		mov word[es:di], 0x0720
		add di, 4
		loop haha
		mov cx, 54
		mov di, 162
	l22:
		mov word[es:di], 0x7720
		add di, 2
		loop l22
		mov cx, 24
		mov di, 160
	l23:
		mov word[es:di], 0x7720
		add di, 160
		loop l23
		push cs
		pop ds
		mov word[es:1476], 0x4720
		mov word[es:1478], 0x4720
		mov word[es:1480], 0x4720
		mov cx, [playerr]
		mov word[es:3520], cx      ;player
		mov word[es:3522], 0x0720
		mov word[es:3948], 0x0720
		mov word[es:3946], 0x0720
		mov word[es:3944], 0x0720
		mov word[es:3950], 0x3457
		mov word[es:3952], 0x3449
		mov word[es:3954], 0x344E
		mov word[es:1612], 0x0245   ;ENEMY
		mov word[es:1680], 0x0245
		mov word[es:1640], 0x0245
		mov word[es:548], 0x0245
		mov word[es:3426], 0x0245
		mov word[es:1672], 0x7847   ;GIFTS
		mov word[es:1320], 0x7847
		mov word[es:3544], 0x7847
		mov word[es:2104], 0x7847
		mov word[es:484], 0x7847
		mov word[es:1620], 0x7847
		
		mov si, 3520
		push si
		call main
		mov sp, bp
		pop bp
		ret

maze2:
		call sidemenu
		push bp
		mov bp, sp
		xor ax, ax
		xor cx, cx
		xor di, di
		xor si, si
		xor bx, bx
		xor dx, dx
		mov ax, 0xb800
		mov es, ax
		mov ds, ax
		mov ax, 0x4720
		mov cx, 13
		mov di, 1922
	left:
		mov word[es:di], ax
		add di, 160
		loop left
		mov di, 342
		push di
		mov cx, 4
	left1:
		mov [es:di], ax
		add di, 160
		loop left1
		push di
		sub di, 160
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		mov [es:di+8], ax
		mov [es:di-152], ax
		pop di
		mov cx, 4
		add di, 320
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		mov [es:di+8], ax
		mov [es:di+168], ax
		push di
		add di, 328
		mov cx, 10
	left3:
		mov [es:di], ax
		add di, 2
		loop left3
		add di, 158
		mov [es:di], ax
		mov [es:di+160], ax
		mov [es:di+162], ax
		mov [es:di+164], ax
		add di, 166
		mov [es:di], ax
		mov [es:di-160], ax
		mov [es:di-320], ax
		sub di, 320
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		add di, 6
		mov cx, 3
	down33:
		mov [es:di], ax
		sub di, 160
		loop down33
		mov cx, 8
		add di, 162
	down34:
		mov [es:di], ax
		add di, 2
		loop down34
		mov [es:di+152], ax
		mov [es:di+312], ax
		add di, 312
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		mov [es:di+8], ax
		mov [es:di+10], ax
		mov [es:di+12], ax
		add di, 12
		mov [es:di-160], ax
		pop di
		mov cx, 7

	left12:
		mov [es:di], ax
		add di, 160
		loop left12
		mov cx, 5
	left21:
		mov [es:di], ax
		sub di, 2
		loop left21
		sub di, 150
		mov cx, 10
	left2:
		mov [es:di-320], ax
		sub di, 2
		loop left2
		pop di
		mov cx, 44
	uppper:
		mov [es:di], ax
		add di, 2
		loop uppper
		sub di, 2
		mov cx, 12
	right:
		mov [es:di], ax
		add di, 160
		loop right
		mov di, 3842
		mov cx, 40
	down:
		mov [es:di], ax
		add di, 2
		loop down
		mov cx, 6
	down1:
		mov [es:di], ax
		sub di, 160
		loop down1
		push di
		sub di, 480
		push di
		mov cx, 23
	down41:
		mov [es:di], ax
		sub di, 2
		loop down41
		pop di
		mov cx, 2
	down3:
		mov [es:di], ax
		sub di, 160
		loop down3
		mov cx, 13
	down4:
		mov [es:di], ax
		add di, 2
		loop down4
		pop di
		mov cx, 10
	down12:
		mov [es:di], ax
		sub di, 2
		loop down12
		add di, 162
		mov [es:di], ax
		mov [es:di+160], ax
		mov [es:di+320], ax
		mov cx, 5
	down12l:
		mov [es:di+320], ax
		add di, 2
		loop down12l
		mov di, 3878
		mov cx, 7
	mid1:
		mov [es:di], ax
		sub di, 160
		loop mid1
		add di, 162
		mov [es:di], ax
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		mov [es:di+8], ax
		mov [es:di+168], ax
		mov [es:di+328], ax
		
		mov di, 578
		mov cx, 7
	m1:
		mov [es:di], ax
		add di, 160
		loop m1
		mov di, 896
		mov cx, 10
	m12:
		mov [es:di], ax
		sub di, 2
		loop m12
		mov [es:di-158], ax
		mov di, 3044
		mov cx, 10
	m13:
		mov [es:di], ax
		add di, 2
		loop m13
		mov [es:di-162], ax
		sub di, 322
		mov cx, 5
	m14:
		mov [es:di], ax
		sub di, 2
		loop m14
		
		mov [es:3704], ax
		mov [es:3544], ax
		mov [es:3384], ax
		mov [es:3386], ax
		mov [es:3388], ax
		mov [es:3390], ax
		mov di, 540
		mov [es:di], ax
		mov [es:di+160], ax
		add di, 320
		mov cx, 8
	m15:
		mov [es:di], ax
		sub di, 2
		loop m15
		mov [es:di-158], ax
		mov di, 1154
		mov cx, 7
	m16:
		mov [es:di], ax
		add di, 4
		loop m16
		mov di, 1210
		mov cx, 4
	m17:
		mov [es:di], ax
		add di, 160
		loop m17
		mov [es:di], ax
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		mov [es:di+6+160], ax
		mov di, 1948
		mov cx, 4
	m18:
		mov [es:di], ax
		mov [es:di+2+160], ax
		mov [es:di+4], ax
		add di, 320
		loop m18
		mov di, 1982
		mov [es:di], ax
		mov [es:di+160], ax
		mov [es:di+320], ax
		mov cx, 8
	m19:
		mov [es:di+2], ax
		add di, 2
		loop m19
		mov di, 3364
		mov cx, 9
	m20:
		mov [es:di], ax
		add di, 2
		loop m20
		mov di, 160*14+84
		mov si, di
		mov word[es:di+160], 0x7720
		mov cx, 13
	m21:
		mov word[es:di], 0x7720
		add di, 2
		loop m21
		add si, 320
		mov cx, 9
	m22:
		mov word[es:si], 0x7720
		add si, 160
		loop m22
		mov di, 182
		mov si, di
		mov cx, 44
	m23:
		mov word[es:di], 0x7720
		add di, 2
		loop m23
		mov cx, 11
	m24:
		mov word[es:si-2], 0x7720
		add si, 160
		loop m24
		mov cx, 11
	m25:
		mov word[es:si-162], 0x7720
		sub si, 2
		loop m25
		mov cx, 14
	m26:
		mov word[es:si], 0x7720
		add si, 160
		loop m26
		mov word[es:2644], 0x3457
		mov word[es:2646], 0x3449
		mov word[es:2648], 0x344E
		mov word[es:2802], 0x4020
		mov word[es:1140], 0x03EA ;player
		mov word[es:1810], 0x0245 ;enemy
		mov word[es:3086], 0x0245
		mov word[es:2900], 0x0245
		mov word[es:698+38], 0x0245
		mov word[es:1512], 0x7847 ;gifts
		mov word[es:3080], 0x7847
		mov word[es:2260], 0x7847
		mov word[es:664], 0x7847
		mov word[es:698], 0x7847
		mov word[es:1512+632], 0x7847
		mov word[es:586], 0xF154  ;treasure
		mov word[es:3684], 0xF154
		mov si, 1140
		push si
		call main
		mov sp, bp
		pop bp
		ret

maze3:
	call sidemenu
	mov ax,0xb800
	mov es,ax
	mov di,322
	mov ax,0x4720
	ll1:
		mov [es:di],ax
		add di,2
		cmp di,426
		jl ll1
		mov di,482
		add di,160
	ll2:
		mov [es:di],ax
		add di,160
		cmp di,3842
		jl ll2
		mov cx,53
	ll3:
		mov [es:di],ax
		add di,2
		cmp di,3842
		loop ll3
		sub di,320
		mov cx,21
	ll4:
		mov [es:di],ax
		sub di,160
		loop ll4
		mov di,488
		mov cx,4
	ll5:
		mov [es:di],ax
		add di,160
		loop ll5
		mov cx,8
		add di,6
	ll6:
		mov [es:di],ax
		add di,2
		loop ll6
		add di,322
		mov cx,4
	ll7:
		mov [es:di],ax
		add di,160
		loop ll7
		mov cx,38
	ll8:
		mov [es:di],ax
		add di,2
		loop ll8
		add di,310
		mov cx,9
	ll9:
		mov [es:di],ax
		add di,160
		loop ll9
		sub di,168
		mov cx,4
	ll10:
		mov [es:di],ax
		sub di,160
		loop ll10
		sub di,314
		mov cx,8
	ll11:
		mov [es:di],ax
		sub di,2
		loop ll11
		mov cx,5
	ll12:
		mov [es:di],ax
		add di,160
		loop ll12
		mov cx,6
	ll13:
		mov [es:di],ax
		sub di,2
		loop ll13
		sub di,320
		mov cx,3
	ll14:
		mov[es:di],ax
		sub di,160
		loop ll14
		mov di,2414
		mov cx,7
	ll15:
		mov[es:di],ax
		add di,160
		loop ll15
		mov cx,9
	ll16:
		mov[es:di],ax
		add di,2
		loop ll16
		mov cx,4
	ll17:
		mov[es:di],ax
		sub di,160
		loop ll17
		sub di,320
		mov cx,16
	ll18:
		mov[es:di],ax
		add di,2
		loop ll18
		mov cx,3
	ll19:
		mov[es:di],ax
		sub di,160
		loop ll19
		mov di,3090
		mov cx,2
	ll20:
		mov[es:di],ax
		add di,160
		loop ll20
		mov cx,9
	ll21:
		mov[es:di],ax
		sub di,2
		loop ll21
		mov di,2314
		mov cx,6
	ll22:
		mov[es:di],ax
		add di,160
		loop ll22
		sub di,162
		mov[es:di],ax
		sub di,2
		mov[es:di],ax
		sub di,170
		mov cx,7
	ll23:
		mov[es:di],ax
		add di,160
		loop ll23
		mov di,1608
		mov cx,7
	ll24:
		mov[es:di],ax
		add di,2
		loop ll24
		mov cx,10
	ll25:
		mov[es:di],ax
		add di,160
		loop ll25
		mov di,820
		mov cx,18
	ll26:
		mov[es:di],ax
		add di,2
		loop ll26
		mov cx,5
	ll27:
		mov[es:di],ax
		add di,160
		loop ll27
		mov cx,12
	ll28:
		mov[es:di],ax
		add di,2
		loop ll28
		mov di,1190
		mov cx,8
	ll29:
		mov[es:di],ax
		add di,2
		loop ll29
		mov cx,3
	ll30:
		mov[es:di],ax
		sub di,160
		loop ll30
		mov cx,5
	ll31:
		mov[es:di],ax
		add di,2
		loop ll31
		mov cx,8
	ll32:
		mov[es:di],ax
		add di,160
		loop ll32
		mov di,1168
		mov cx,4
	ll33:
		mov[es:di],ax
		sub di,2
		loop ll33
		mov cx,4
	ll34:
		mov[es:di],ax
		add di,160
		loop ll34
		mov cx,5
	ll35:
		mov[es:di],ax
		add di,2
		loop ll35
		mov ax,0x0245
		mov di,1296
		mov[es:di],ax
		mov di,1030
		mov[es:di],ax
		mov di,2758
		mov[es:di],ax
		mov ax,0x7847
		mov di,582
		mov[es:di],ax
		mov di,1936
		mov[es:di],ax
		mov di,976
		mov[es:di],ax
		mov ax,0xf154
		mov di,3136
		mov[es:di],ax
		mov di,3736
		mov[es:di],ax
		mov ax,0x3457
		mov di,3788
		mov [es:di],ax
		mov ax,0x3449
		add di,2
		mov [es:di],ax
		mov ax,0x344e
		add di,2
		mov [es:di],ax
		mov di,160
		mov ax,0x7720
		mov cx,54
	lll1:
		mov [es:di],ax
		add di,2
		loop lll1
		mov cx,22
		mov di,160
		mov cx,24
	lll2:
		mov [es:di],ax
		add di,160
		loop lll2
		mov cx, [playerr]
		mov word[es:480], cx
		mov si, 480
		push si
		call main
		ret

main:
;3520 maze1 player
;player:3720
;wall: 2720
;space: 0720
	
	push bp
	mov bp, sp
	pusha
	mov ax, 0xb800
	mov es, ax
	
	mov di, [bp+4]
	push cs
	pop ds
	press:
		cmp byte[chan], 1
		jz changel
		cmp byte[chan], 2
		jz changer
		cmp byte[chan], 3
		jz changeu
		cmp byte[chan], 4
		jz changed
	    xor dx, dx
		mov ah, 00
		int 0x16
		cmp al, 'w'
		jz upp
		cmp al, 'a'
		jz leftt
		cmp al, 's'
		jz downn
		cmp al, 'd'
		jz rightt
		cmp al, 'm'
		jz supermann
		jmp press
		
	rightt:
		mov dx, [es:di+2]
		cmp dx, 0x0720
		jz changer
		cmp word[es:di+2], 0x3457
		jz win
		cmp word[es:di+2], 0x0245
		jz enee
		cmp word[es:di+2], 0x7847
		jz gif
		cmp word[es:di+2], 0xF154
		jz tres
		jmp press
		changer:
			mov byte[chan], 0
			mov word[es:di], 0x0720
			add di, 2
			mov cx, [playerr]
			mov word[es:di], cx
			jmp press
			
	leftt: 
		mov dx, [es:di-2]
		cmp dx, 0x0720
		jz changel
		cmp word[es:di-2], 0x3457
		jz win
		cmp word[es:di-2], 0x0245
		jz enee
		cmp word[es:di-2], 0x7847
		jz gif
		cmp word[es:di-2], 0xF154
		jz tres
		jmp press
		changel:
			mov byte[chan], 0
			mov word[es:di], 0x0720
			sub di, 2
			mov cx, [playerr]  ;;
			mov word[es:di], cx
		
			jmp press
			
	upp:
		mov dx, [es:di-160]
		cmp dx, 0x0720
		jz changeu
		cmp word[es:di-160], 0x3457
		jz win
		cmp word[es:di-160], 0x0245
		jz enee
		cmp word[es:di-160], 0x7847
		jz gif
		cmp word[es:di-160], 0xF154
		jz tres 
		jmp press
		changeu:
			mov byte[chan], 0
			mov word[es:di], 0x0720
			sub di, 160
			mov cx, [playerr]  ;;
			mov word[es:di], cx
			jmp press
			
	downn:
		cmp di, 3946
		jz press
		cmp di, 3944
		jz press
		cmp di, 3948
		jz press
		mov dx, [es:di+160]
		cmp dx, 0x0720
		jz changed
		cmp word[es:di+160], 0x3457
		jz win
		cmp word[es:di+160], 0x0245
		jz enee
		cmp word[es:di+160], 0x7847
		jz gif
		cmp word[es:di+160], 0xF154
		jz tres
		jmp press
		
enee:
	mov byte[dir], 'e'
	jmp enemmm
gif:
	mov byte[dir], 'g'
	jmp enemmm
tres:
	mov byte[dir], 't'
enemmm:
		push dx
		push di
		call enemy
		eeend:
		pop dx
		cmp dx, 0
		jz termi
		jmp press
			changed:
				mov byte[chan], 0
				mov word[es:di], 0x0720
				add di, 160
				mov cx, [playerr]
				mov word[es:di], cx    ;player
				jmp press
	
	supermann:
		mov cx, [supcounter]
		cmp cx, 2
		jz press
		inc cx
		mov word[supcounter], cx
		
	superman:         ;superman mode
		mov bx, supermanmode
		mov word[playerr], 0xB0E4
		call pos
		push si
		mov si, [playerpos]
		mov cx, [playerr]
		mov [es:si], cx
		pop si
		mov cx, 13
		push di
		mov di, 2680
		mov ah, 0x30
		push si
		mov si, 0
		l40:
			mov al, [bx+si]
			mov [es:di], ax
			add di, 2
			inc si
			loop l40
			mov cx, 9
			mov di, 2844
		l41:
			mov al, [bx+si]
			mov [es:di], ax
			add di, 2
			inc si
			loop l41
			pop si
			pop di
		mov byte[supvar], 1
		mov byte[livc], 3
		push di
		mov di, 1414
		mov word[es:di], 0xF42A
		mov word[es:di+2], 0xF42A
		mov word[es:di+4], 0xF42A
		pop di
		cmp word[es:di+2], 0x4720
		jz abover
		cmp word[es:di-2], 0x4720
		jz abovel
		cmp word[es:di+160], 0x4720
		jz aboved
		cmp word[es:di-160], 0x4720
		jz aboveu
		
		abover:
			cmp word[es:di+4], 0x7720
			jz press
			mov word[es:di], 0x0720
			add di, 4
			mov cx, [playerr]
			mov word[es:di], cx ;;
			jmp press
		
		abovel:
			cmp word[es:di-4], 0x7720
			jz press
			mov word[es:di], 0x0720
			sub di, 4
			mov cx, [playerr]
			mov word[es:di], cx
			jmp press
			
		aboved:
			cmp word[es:di+320], 0x7720
			jz press
			mov word[es:di], 0x0720
			add di, 320
			mov cx, [playerr]
			mov word[es:di], cx
			jmp press	
			
		aboveu:
			cmp word[es:di-320], 0x7720
			jz press
			mov word[es:di], 0x0720
			sub di, 320
			mov cx, [playerr]
			mov word[es:di], cx
			jmp press	
	win:
		mov word[livc], 4
		call yeay
	
termi:
		popa
		mov sp, bp
		pop bp
		ret
		
enemy:
;enemy: 0245
;gift: 7847
	push bp
	mov bp, sp
	push ax
	push bx
	push cx
	push dx
	push di
	
	push cs
	pop ds
	mov di, [bp+4]
	xor ax, ax
	xor bx, bx
	xor cx, cx
	mov bx, 10
	mov cx, 0
	cmp byte[dir], 'e'
	jz enem
	cmp byte[dir], 'g'
	jz gift
	cmp byte[dir], 't'
	jz treasure
	jmp te
	
	
	enem:
		cmp byte[supvar], 1
		jz te
		mov al, [livc]
		dec al
		cmp al, 2
		jz two
		cmp al, 1
		jz one
		cmp al, 0
		jz ened
		jmp cont
		two:
		mov word[es:1418], 0x7020
		mov [livc], al
		jmp cont
		one:
		mov word[es:1416], 0x7020
		mov [livc], al
		jmp cont
		ened:
		mov word[es:1414], 0x7020
		push bx
		push si
		overr:
		mov word[livc], 0
		mov bx, over
		mov di, 1414
		mov cx, 9
		mov si, 0
		mov ah, 0xF4
		enddd:
			mov al, [bx+si]
			mov [es:di], ax
			add di, 2
			inc si
			loop enddd
		pop si
		pop bx
		mov word[bp+6], 0
		jmp te
		
		cont:
		xor ax, ax
		mov ax, [score]
		sub ax, 10
		cmp ax, 0
		jl overr
		
		mov word[score], ax
		jmp scr
		
	gift:
		cmp word[es:di-2], 0x7847
		jz llf
		cmp word[es:di+2], 0x7847
		jz rrf
		cmp word[es:di-160], 0x7847
		jz uuf
		cmp word[es:di+160], 0x7847
		jz ddf
		jmp giftss
		llf:
			mov byte[chan], 1
			jmp giftss
		rrf:
			mov byte[chan], 2
			jmp giftss
		uuf:
			mov byte[chan], 3
			jmp giftss
		ddf:
			mov byte[chan], 4
		giftss:
		xor ax, ax
		mov ax, [score]
		cmp byte[supvar], 1
		jnz adder
		add ax, 10
		adder:
		add ax, 10
		mov [score], ax
		jmp scr
		
	treasure:
		xor ax, ax
		mov ax, [score]
		cmp byte[supvar], 1
		jnz addert
		add ax, 50
		addert:
		add ax, 50
		mov [score], ax
scr:
	xor dx, dx
	div bx
	add dx, 0x30
	push dx
	inc cx
	cmp ax, 0
	jnz scr
	mov si, 934
	nextscr:
		pop dx		
		mov dh, 0x07
		mov [es:si], dx
		add si, 2
		loop nextscr
te:
	pop di
	pop dx
	pop cx
	pop bx
	pop ax
	mov sp, bp
	pop bp
	ret 2

printscreen:
	push bp
	mov bp,sp
	mov ax,0xb800
	mov es,ax
	mov ax,0x3720
	mov di, 810
	mov si, 948
	mov dx, di
	mov bx, si
	mov cx, 3
	l1:
		mov [es:di],ax
		mov [es:si],ax
		call delay
		add di, 2
		sub si ,2
		loop l1
		
		sub di, 6
		add si, 6
		mov [es:di],ax
		mov [es:si],ax
		mov cx, 10
	sides:
		add di, 160
		add si, 160
		mov [es:di], ax
		mov [es:di+2],ax
		mov [es:si], ax
		mov [es:si-2],ax
		call delay
		loop sides
		mov cx, 10
	l2:
		mov [es:di],ax
		mov [es:si],ax
		add di, 2
		sub si ,2
		call delay
		loop l2
		mov ax, 0x3720
	game:
		mov di, dx 
		add di, 16
		mov dx, di
		mov cx, 8
	A:
		mov [es:di], ax   			;AETHERFALL
		add di, 160
		call delay
		loop A
		mov [num], di
		mov di, dx
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		add di, 8
		push di
		add di, 320
		mov [es:di-2], ax
		mov [es:di-4], ax
		mov [es:di-6], ax
		pop di
		mov dx, di
		mov cx, 5
	A1:
		mov [es:di],ax
		add di, 160
		call delay
		loop A1
		mov di, dx
		add di, 4
		mov dx, di
		mov cx, 5
	E:
		mov [es:di],ax
		add di, 160
		call delay
		loop E
		mov di, dx 
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		add di, 320
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		add di, 320
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		mov di, dx
		add di, 8
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		mov [es:di+8], ax
		mov [es:di+10], ax
		add di, 6
		mov dx, di
		mov cx, 5
	T:
		mov [es:di],ax
		add di, 160
		call delay
		loop T
		mov di, dx
		add di, 8
		mov dx, di
		mov cx, 5
	H:
		mov [es:di],ax
		add di, 160
		call delay
		loop H
		mov di, dx
		add di, 6
		mov dx, di
		mov cx, 5
	H1:
		mov [es:di],ax
		add di, 160
		call delay
		loop H1
		sub di, 480
		mov [es:di-2], ax
		mov [es:di-4], ax
		mov [es:di-6], ax
		add di, 4
		sub di, 320
		mov dx, di
		mov cx, 5
	E2:
		mov [es:di],ax
		add di, 160
		call delay
		loop E2
		mov di, dx 
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		add di, 320
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		add di, 320
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		mov di, dx
		add di, 10
		mov dx, di
		mov cx, 5
	R:
		mov [es:di],ax
		add di, 160
		call delay
		loop R
		mov di, dx
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		mov [es:di+8], ax
		mov [es:di+168], ax
		mov [es:di+168], ax
		add di, 320
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		mov [es:di+8], ax
		add di, 164
		mov cx, 3
	R1:
		mov [es:di], ax
		add di, 162
		call delay
		loop R1
		add dx, 12
		mov di, dx
		mov cx, 5
	F:
		mov [es:di],ax
		add di, 160
		call delay
		loop F
		mov di, dx
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		add di, 320
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		add dx, 10
		mov di, dx
		mov cx, 5
	A2:
		mov [es:di],ax
		add di, 160
		call delay
		loop A2
		mov di, dx
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		add di, 8
		push di
		add di, 320
		mov [es:di-2], ax
		mov [es:di-4], ax
		mov [es:di-6], ax
		pop di
		mov cx, 5
	A3:
		mov [es:di],ax
		add di, 160
		call delay
		loop A3
		add dx, 12
		mov di, dx
		mov cx, 5
	L:
		mov [es:di],ax
		add di, 160
		call delay
		loop L
		sub di, 160
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
		add dx, 12
		mov di, dx
		mov cx, 5
	L2:
		mov [es:di],ax
		add di, 160
		call delay
		loop L2 
		sub di, 160
		mov [es:di+2], ax
		mov [es:di+4], ax
		mov [es:di+6], ax
	welcome:
		mov di, 220
		mov si, 380
		mov ax, 0x4720
		mov [es:di], ax
		mov [es:di+160], ax
		mov cx, 19
	box:
		mov [es:di], ax
		mov [es:si], ax
		add di, 2
		add si, 2
		call delay
		loop box
		mov di, 540
		mov [es:di], ax
		mov cx, 19
	boxx:
		mov [es:di], ax
		add di, 2
		call delay
		loop boxx
		mov di, 392
		mov al, 0x57
		mov [es:di], ax
		add di,2
		mov al, 0x45
		mov [es:di], ax
		add di,2
		mov al, 0x4C
		mov [es:di], ax
		add di,2
		mov al, 0x43
		mov [es:di], ax
		add di,2
		mov al, 0x4F
		mov [es:di], ax
		add di,2
		mov al, 0x4D
		mov [es:di], ax
		add di,2
		mov al, 0x45
		mov [es:di], ax

	Options:
		mov ax, 0x1720
		mov di, [num]
		sub di, 140
		mov [num], di
		mov si, di
		add si, 160
		mov cx, 12
	begin:
		mov [es:di], ax
		mov [es:si], ax
		add di, 2
		add si, 2
		call delay
		loop begin
		add si, 158
		mov cx, 12
	bb:
		mov [es:si], ax
		sub si, 2
		call delay
		loop bb
		mov di, [num]
		add di, 168
		mov al, 0x50
		mov [es:di], ax
		add di, 2
		mov al, 0x4C
		mov [es:di], ax
		add di, 2
		mov al, 0x41
		mov [es:di], ax
		add di, 2
		mov al, 0x59
		mov [es:di], ax
		mov si, [num]
		add si, 12
		add si, 320
		mov di, si
		add si, 160	
		add di, 320
		add si, 320
		mov [num], si
		mov cx, 12
		mov ax, 0x1720
	beg2:
		mov [es:di], ax
		mov [es:si], ax
		add di, 2
		add si, 2
		call delay
		loop beg2
		add si, 158
		mov cx, 12
	bb2:
		mov [es:si], ax
		sub si, 2
		call delay
		loop bb2
		mov di, [num]
		mov [num], si
		add di, 6
		mov al, 0x43
		mov [es:di], ax
		add di, 2
		mov al, 0x52
		mov [es:di], ax
		add di, 2
		mov al, 0x45
		mov [es:di], ax
		add di, 2
		mov al, 0x44
		mov [es:di], ax
		add di, 2
		mov al, 0x49
		mov [es:di], ax
		add di, 2
		mov al, 0x54
		mov[es:di], ax
		add di, 2
		mov al, 0x53
		mov [es:di], ax
		mov si, [num]
		add si, 334
		mov di, si
		add si, 160
		mov [num], si
		mov ax, 0x1720
		mov cx, 12
	beg3:
		mov [es:di], ax
		mov [es:si], ax
		add di,2
		add si,2
		call delay
		loop beg3
		mov [loc], si
		mov cx, 12
		add si, 158
	bb3:
		mov [es:si],ax
		sub si, 2
		call delay
		loop bb3
		mov si, [num]
		add si, 8
		mov al, 0x45
		mov [es:si], ax
		add si, 2
		mov al, 0x58
		mov [es:si], ax
		add si, 2
		mov al, 0x49
		mov [es:si], ax
		add si, 2
		mov al, 0x54
		mov [es:si], ax
		
		mov sp, bp
		pop bp
		ret

credits:
	push bp
	mov bp, sp
	
	pusha
	mov bx, part
	mov si, 0
	mov cx, 23
	mov di, 1820
	mov ah, 0x7B
	part1:	
		mov al, [bx+si]
		mov [es:di], ax
		add di, 2
		inc si
		loop part1
	
	mov bx, parte
	mov si, 0
	mov cx, 24
	mov di, 2140
	part2:
		mov al, [bx+si]
		mov [es:di], ax
		add di, 2
		inc si
		loop part2
	popa
	mov sp, bp
	pop bp
	ret

loadd:
	push bp
	mov bp, sp
	
		mov di, 2004
		mov bx, load
		mov ah, 0x06
		mov si, 0
		mov cx, 8
	loaddd:
		mov al, [bx+si]
		mov [es:di], ax
		add di, 2
		inc si
		loop loaddd
		mov si, 1986
		mov ax, 0x072E
		mov cx, 18
	loading:
		mov [es:si], ax
		mov [es:si+160], ax
		add si, 2
		call delay
		call delay
		call delay
		call delay
		call delay
		call delay
		loop loading
		
	mov sp, bp
	pop bp
	ret

exit:
	push bp
	mov bp, sp
	
	mov bx, exitt
	mov si, 0
	mov cx, 15
	mov di, 1980
	mov ah, 0x03
	part3:	
		mov al, [bx+si]
		mov [es:di], ax
		add di, 2
		inc si
		loop part3
		
	mov sp, bp
	pop bp
	ret
	
timer:
    push ax
	push bx
	push dx
	
	cmp byte[supvar], 1
	jz supmode
	jmp  continu
	supmode:
		mov word[playerr], 0xB0E4
		mov ax, [supcount]
		dec word[supcount]
		cmp ax, 0
		jle endsup
		jmp continu
	endsup:
		mov byte[supvar], 0
		push cx
		mov cx, [supc1]
		mov word[supcount], cx
		pop cx
		mov word[playerr], 0x03EA
		mov cx, 13
		push di
		mov di, 2680
		l42:
			mov word[es:di], 0x7720
			add di, 2
			loop l42
			mov cx, 9
			mov di, 2844
		l43:
			mov word[es:di], 0x7720
			add di, 2
			loop l43
			pop di
	
	continu:
	cmp word[livc], 0
	je eend
	cmp word[livc], 4
	je eend
	xor dx, dx
	xor ax, ax
    dec word [cs:tickticks]
	mov ax, [cs:tickticks]
	mov bx, 18
	div bx	
    push ax
    call printnum       ; Display the counter
	cmp ax, 0
	jle livesnull
    jmp eend
	
		livesnull:
		push cs
		pop ds
		mov word[livc], 0
		mov bx, timee
		mov di, 1414 
		mov cx, 9
		mov si, 0
		mov ah, 0xF4
		ennddd:
			mov al, [bx+si]
			mov [es:di], ax
			add di, 2
			inc si
			loop ennddd
			jmp termi
		
	eend:
    mov al, 0x20        ; Send EOI to PIC
    out 0x20, al
    
	pop dx
	pop bx
    pop ax
    iret
	
printnum:     push bp 
              mov  bp, sp 
              push es 
              push ax 
              push bx 
              push cx 
              push dx 
              push di 
 
              mov  ax, 0xb800 
              mov  es, ax             
              mov  ax, [bp+4]         
              mov  bx, 10             
              mov  cx, 0 
			  push si
			  push cx
	 		  call pos
			  mov si, [playerpos]
			  mov cx, [playerr]
			  mov [es:si], cx
			  pop cx
			  pop si
 
nextdigit:    mov  dx, 0              
              div  bx                 
              add  dl, 0x30           
              push dx                 
              inc  cx                 
              cmp  ax, 0               
              jnz  nextdigit          
 
              mov  di, 2050          
				
			  cmp cx, 1
			  jz singledigit
				
nextpos:      pop  dx                
              mov  dh, 0x07           
              mov  [es:di], dx         
              add  di, 2              
              loop nextpos            
			  jmp termn
				
singledigit:				
			  pop  dx                
              mov  dh, 0x07           
              mov  [es:di], dx         
              add  di, 2              
              loop singledigit
			  
			  mov  word[es:di], 0x0720
			  
termn: 
              pop  di 
              pop  dx 
              pop  cx 
              pop  bx 
              pop  ax
              pop  es 
              pop  bp 
              ret  2 
	
start:
	call clrscrn
	call printscreen
	beginn:
	mov ah, 00
	int 0x16
	cmp al, 'p'
	jz play
	cmp al, 'e'
	jz exi
	cmp al, 'c'
	jz cred
	jmp beginn
	
play:
	call clrscrn
	call loadd
	call clrscrn
	xor  ax, ax 
	mov  es, ax                
	cli                        
	mov  word [es:8*4], timer   
	mov  [es:8*4+2], cs         
	sti 
	call GenRandNum
	mov bx, [randNum]
	cmp bx, 0
	jz mmz1
	cmp bx, 1
	jz mmz2
	cmp bx, 2
	jz mmz2
	cmp bx, 3
	jz mmz3
mmz1:
	call maze1
	jmp term
mmz2:
	call maze2
	jmp term
mmz3:
	call maze3
	jmp term
cred:
	call clrscrn
	call credits
	jmp beginn
exi:
	call clrscrn
	call exit
term:
	jmp $
	mov ax, 0x4c00
	int 0x21