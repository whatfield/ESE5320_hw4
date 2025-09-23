	.arch armv8-a+crypto+crc
	.file	"Filter.cpp"
	.text
	.align	2
	.p2align 4,,15
	.global	Filter_horizontal(unsigned char const*, unsigned char*)
	.type	Filter_horizontal(unsigned char const*, unsigned char*), %function
Filter_horizontal(unsigned char const*, unsigned char*):
.LFB19:
	.cfi_startproc
	add	x15, x1, 126976
	adrp	x2, .LANCHOR0
	add	x2, x2, :lo12:.LANCHOR0
	mov	x14, x1
	add	x13, x0, 474
	add	x15, x15, 1004
.L3:
	sub	x0, x13, #474
	mov	x8, x14
	.p2align 3,,7
.L2:
	ldrb	w7, [x0, 1]
	add	x0, x0, 1
	ldp	w12, w9, [x2]
	ldp	w11, w4, [x2, 8]
	ldrb	w3, [x0, 2]
	mul	w7, w7, w9
	ldrb	w1, [x0, -1]
	ldrb	w6, [x0, 1]
	ldrb	w5, [x0, 4]
	ldr	w10, [x2, 20]
	mul	w3, w3, w4
	ldr	w9, [x2, 16]
	madd	w1, w1, w12, w7
	ldrb	w4, [x0, 3]
	madd	w6, w6, w11, w3
	ldr	w7, [x2, 24]
	mul	w5, w5, w10
	ldrb	w3, [x0, 5]
	add	w1, w1, w6
	cmp	x13, x0
	madd	w4, w4, w9, w5
	add	w1, w1, w4
	madd	w1, w3, w7, w1
	lsr	w1, w1, 8
	strb	w1, [x8], 1
	bne	.L2
	add	x14, x14, 474
	add	x13, x13, 480
	cmp	x15, x14
	bne	.L3
	ret
	.cfi_endproc
.LFE19:
	.size	Filter_horizontal(unsigned char const*, unsigned char*), .-Filter_horizontal(unsigned char const*, unsigned char*)
	.align	2
	.p2align 4,,15
	.global	Filter_vertical(unsigned char const*, unsigned char*)
	.type	Filter_vertical(unsigned char const*, unsigned char*), %function
Filter_vertical(unsigned char const*, unsigned char*):
.LFB20:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	adrp	x2, .LANCHOR0
	add	x2, x2, :lo12:.LANCHOR0
	mov	x29, sp
	mov	x7, x0
	mov	x15, x1
	mov	x30, 1896
	mov	x18, 1422
	mov	x17, 948
	mov	x14, 474
	mov	x16, 0
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	x20, 2844
	mov	x19, 2370
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -16
	.cfi_offset 22, -8
.L9:
	sub	x13, x17, x16
	sub	x12, x18, x16
	sub	x11, x14, x16
	sub	x10, x30, x16
	sub	x9, x19, x16
	sub	x8, x20, x16
	add	x13, x7, x13
	add	x12, x7, x12
	add	x11, x7, x11
	add	x10, x7, x10
	add	x9, x7, x9
	add	x8, x7, x8
	mov	x0, x16
	.p2align 3,,7
.L8:
	ldrb	w21, [x7, x0]
	ldr	w22, [x2]
	ldrb	w6, [x11, x0]
	ldrb	w3, [x12, x0]
	ldr	w4, [x2, 12]
	mul	w21, w21, w22
	ldr	w22, [x2, 4]
	ldrb	w1, [x13, x0]
	ldrb	w5, [x9, x0]
	mul	w3, w3, w4
	ldrb	w4, [x10, x0]
	madd	w6, w6, w22, w21
	ldr	w21, [x2, 8]
	madd	w1, w1, w21, w3
	ldrb	w3, [x8, x0]
	add	w1, w1, w6
	ldp	w6, w21, [x2, 16]
	mul	w5, w5, w21
	ldr	w21, [x2, 24]
	madd	w4, w4, w6, w5
	add	w1, w1, w4
	madd	w1, w3, w21, w1
	lsr	w1, w1, 8
	strb	w1, [x15, x0]
	add	x0, x0, 1
	cmp	x14, x0
	bne	.L8
	add	x16, x16, 474
	add	x14, x14, 474
	sub	x0, x16, #122880
	add	x17, x17, 474
	add	x18, x18, 474
	add	x30, x30, 474
	add	x19, x19, 474
	add	x20, x20, 474
	subs	x0, x0, #2256
	bne	.L9
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE20:
	.size	Filter_vertical(unsigned char const*, unsigned char*), .-Filter_vertical(unsigned char const*, unsigned char*)
	.align	2
	.p2align 4,,15
	.global	Filter(unsigned char const*, unsigned char*)
	.type	Filter(unsigned char const*, unsigned char*), %function
Filter(unsigned char const*, unsigned char*):
.LFB21:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	mov	x19, x0
	mov	x20, x1
	mov	x0, 62444
	movk	x0, 0x1, lsl 16
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	.cfi_offset 23, -16
	bl	malloc
	adrp	x2, .LANCHOR0
	add	x5, x2, :lo12:.LANCHOR0
	add	x3, x19, 6
	mov	x7, x0
	ldr	w9, [x2, #:lo12:.LANCHOR0]
	mov	w6, 0
	ldp	w10, w11, [x5, 4]
	ldp	w15, w12, [x5, 12]
	ldp	w14, w13, [x5, 20]
	.p2align 3,,7
.L15:
	mov	x1, 0
	ldrb	w22, [x3, -6]
	ldrb	w18, [x3, -5]
	ldrb	w17, [x3, -4]
	ldrb	w16, [x3, -3]
	ldrb	w8, [x3, -2]
	ldrb	w5, [x3, -1]
.L14:
	mul	w19, w5, w14
	mov	w23, w5
	ldrb	w5, [x3, x1]
	mul	w4, w17, w11
	mul	w21, w8, w12
	madd	w4, w18, w10, w4
	madd	w21, w16, w15, w21
	madd	w19, w5, w13, w19
	add	w4, w4, w21
	add	w4, w4, w19
	madd	w4, w22, w9, w4
	mov	w22, w18
	mov	w18, w17
	mov	w17, w16
	mov	w16, w8
	mov	w8, w23
	lsr	w4, w4, 8
	strb	w4, [x7, x1]
	add	x1, x1, 1
	cmp	x1, 474
	bne	.L14
	add	w6, w6, 480
	add	x3, x3, 480
	sub	w4, w6, #126976
	add	x7, x7, 474
	subs	w4, w4, #2624
	bne	.L15
	mov	x16, 59600
	movk	x16, 0x1, lsl 16
	add	x2, x2, :lo12:.LANCHOR0
	add	x21, x0, 948
	add	x30, x0, 1422
	add	x19, x0, 1896
	add	x18, x0, 2370
	add	x17, x0, 2844
	mov	x6, 0
	b	.L19
	.p2align 2,,3
.L16:
	add	x6, x6, 474
	add	x1, x1, 474
	cmp	x6, x16
	beq	.L18
	ldp	w9, w10, [x2]
	ldp	w11, w15, [x2, 8]
	ldp	w12, w14, [x2, 16]
	ldr	w13, [x2, 24]
.L19:
	sub	x7, x1, x6
	mov	x8, x6
	add	x7, x0, x7
.L17:
	ldrb	w22, [x0, x8]
	ldrb	w5, [x30, x8]
	ldrb	w4, [x7, x8]
	ldrb	w3, [x21, x8]
	ldrb	w23, [x18, x8]
	mul	w9, w22, w9
	ldrb	w22, [x19, x8]
	mul	w15, w5, w15
	madd	w4, w4, w10, w9
	ldrb	w5, [x17, x8]
	madd	w3, w3, w11, w15
	mul	w14, w23, w14
	madd	w12, w22, w12, w14
	add	w3, w4, w3
	add	w3, w3, w12
	madd	w3, w5, w13, w3
	lsr	w3, w3, 8
	strb	w3, [x20, x8]
	add	x8, x8, 1
	cmp	x1, x8
	beq	.L16
	ldp	w9, w10, [x2]
	ldp	w11, w15, [x2, 8]
	ldp	w12, w14, [x2, 16]
	ldr	w13, [x2, 24]
	b	.L17
	.p2align 2,,3
.L18:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	free
	.cfi_endproc
.LFE21:
	.size	Filter(unsigned char const*, unsigned char*), .-Filter(unsigned char const*, unsigned char*)
	.global	Coefficients
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	Coefficients, %object
	.size	Coefficients, 28
Coefficients:
	.word	2
	.word	15
	.word	62
	.word	98
	.word	62
	.word	15
	.word	2
	.ident	"GCC: (GNU) 9.2.0"
	.section	.note.GNU-stack,"",@progbits
