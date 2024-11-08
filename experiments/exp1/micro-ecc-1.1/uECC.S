	.text
	.file	"uECC.c"
	.globl	uECC_set_rng                    # -- Begin function uECC_set_rng
	.type	uECC_set_rng,@function
uECC_set_rng:                           # @uECC_set_rng
	.cfi_startproc
# %bb.0:
	movq	%rdi, g_rng_function(%rip)
	retq
.Lfunc_end0:
	.size	uECC_set_rng, .Lfunc_end0-uECC_set_rng
	.cfi_endproc
                                        # -- End function
	.globl	uECC_get_rng                    # -- Begin function uECC_get_rng
	.type	uECC_get_rng,@function
uECC_get_rng:                           # @uECC_get_rng
	.cfi_startproc
# %bb.0:
	movq	g_rng_function(%rip), %rax
	retq
.Lfunc_end1:
	.size	uECC_get_rng, .Lfunc_end1-uECC_get_rng
	.cfi_endproc
                                        # -- End function
	.globl	uECC_curve_private_key_size     # -- Begin function uECC_curve_private_key_size
	.type	uECC_curve_private_key_size,@function
uECC_curve_private_key_size:            # @uECC_curve_private_key_size
	.cfi_startproc
# %bb.0:
	movswl	2(%rdi), %eax
	leal	7(%rax), %ecx
	addl	$14, %eax
	testl	%ecx, %ecx
	cmovnsl	%ecx, %eax
	sarl	$3, %eax
                                        # kill: def $eax killed $eax killed $rax
	retq
.Lfunc_end2:
	.size	uECC_curve_private_key_size, .Lfunc_end2-uECC_curve_private_key_size
	.cfi_endproc
                                        # -- End function
	.globl	uECC_curve_public_key_size      # -- Begin function uECC_curve_public_key_size
	.type	uECC_curve_public_key_size,@function
uECC_curve_public_key_size:             # @uECC_curve_public_key_size
	.cfi_startproc
# %bb.0:
	movsbl	1(%rdi), %eax
	addl	%eax, %eax
	retq
.Lfunc_end3:
	.size	uECC_curve_public_key_size, .Lfunc_end3-uECC_curve_public_key_size
	.cfi_endproc
                                        # -- End function
	.globl	uECC_secp160r1                  # -- Begin function uECC_secp160r1
	.type	uECC_secp160r1,@function
uECC_secp160r1:                         # @uECC_secp160r1
	.cfi_startproc
# %bb.0:
	leaq	curve_secp160r1(%rip), %rax
	retq
.Lfunc_end4:
	.size	uECC_secp160r1, .Lfunc_end4-uECC_secp160r1
	.cfi_endproc
                                        # -- End function
	.globl	uECC_secp192r1                  # -- Begin function uECC_secp192r1
	.type	uECC_secp192r1,@function
uECC_secp192r1:                         # @uECC_secp192r1
	.cfi_startproc
# %bb.0:
	leaq	curve_secp192r1(%rip), %rax
	retq
.Lfunc_end5:
	.size	uECC_secp192r1, .Lfunc_end5-uECC_secp192r1
	.cfi_endproc
                                        # -- End function
	.globl	uECC_secp224r1                  # -- Begin function uECC_secp224r1
	.type	uECC_secp224r1,@function
uECC_secp224r1:                         # @uECC_secp224r1
	.cfi_startproc
# %bb.0:
	leaq	curve_secp224r1(%rip), %rax
	retq
.Lfunc_end6:
	.size	uECC_secp224r1, .Lfunc_end6-uECC_secp224r1
	.cfi_endproc
                                        # -- End function
	.globl	uECC_secp256r1                  # -- Begin function uECC_secp256r1
	.type	uECC_secp256r1,@function
uECC_secp256r1:                         # @uECC_secp256r1
	.cfi_startproc
# %bb.0:
	leaq	curve_secp256r1(%rip), %rax
	retq
.Lfunc_end7:
	.size	uECC_secp256r1, .Lfunc_end7-uECC_secp256r1
	.cfi_endproc
                                        # -- End function
	.globl	uECC_secp256k1                  # -- Begin function uECC_secp256k1
	.type	uECC_secp256k1,@function
uECC_secp256k1:                         # @uECC_secp256k1
	.cfi_startproc
# %bb.0:
	leaq	curve_secp256k1(%rip), %rax
	retq
.Lfunc_end8:
	.size	uECC_secp256k1, .Lfunc_end8-uECC_secp256k1
	.cfi_endproc
                                        # -- End function
	.globl	uECC_make_key                   # -- Begin function uECC_make_key
	.type	uECC_make_key,@function
uECC_make_key:                          # @uECC_make_key
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %r14
	movq	%rsi, (%rsp)                    # 8-byte Spill
	movq	%rdi, 8(%rsp)                   # 8-byte Spill
	leaq	40(%rdx), %r12
	movl	$64, %r15d
	leaq	16(%rsp), %r13
	leaq	48(%rsp), %rbx
	xorl	%ebp, %ebp
.LBB9_2:                                # =>This Inner Loop Header: Depth=1
	movswl	2(%r14), %eax
	leal	63(%rax), %ecx
	addl	$126, %eax
	testl	%ecx, %ecx
	cmovnsl	%ecx, %eax
	shrl	$6, %eax
	movsbl	%al, %edx
	movq	%r13, %rdi
	movq	%r12, %rsi
	callq	uECC_generate_random_int
	testl	%eax, %eax
	je	.LBB9_13
# %bb.3:                                #   in Loop: Header=BB9_2 Depth=1
	movq	%rbx, %rdi
	movq	%r13, %rsi
	movq	%r14, %rdx
	callq	EccPoint_compute_public_key
	testq	%rax, %rax
	jne	.LBB9_4
# %bb.1:                                #   in Loop: Header=BB9_2 Depth=1
	decq	%r15
	jne	.LBB9_2
	jmp	.LBB9_13
.LBB9_4:
	movswl	2(%r14), %ecx
	leal	7(%rcx), %edx
	leal	14(%rcx), %eax
	testl	%edx, %edx
	cmovnsl	%edx, %eax
	testl	%ecx, %ecx
	movq	8(%rsp), %r10                   # 8-byte Reload
	movq	(%rsp), %r9                     # 8-byte Reload
	jle	.LBB9_7
# %bb.5:
	sarl	$3, %eax
	movl	%eax, %edx
	negq	%rdx
	leal	-8(,%rax,8), %esi
	decl	%eax
	xorl	%edi, %edi
.LBB9_6:                                # =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	andl	$-8, %ecx
	movq	16(%rsp,%rcx), %r8
	movl	%esi, %ecx
	andb	$56, %cl
	shrq	%cl, %r8
	movb	%r8b, (%r9,%rdi)
	incq	%rdi
	addl	$-8, %esi
	decl	%eax
	movq	%rdx, %rcx
	addq	%rdi, %rcx
	jne	.LBB9_6
.LBB9_7:
	movsbl	1(%r14), %eax
	movl	$1, %ebp
	testl	%eax, %eax
	jle	.LBB9_13
# %bb.8:
	movl	%eax, %edx
	negq	%rdx
	leal	-8(,%rax,8), %esi
	decl	%eax
	xorl	%edi, %edi
.LBB9_9:                                # =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	andl	$-8, %ecx
	movq	48(%rsp,%rcx), %r8
	movl	%esi, %ecx
	andb	$56, %cl
	shrq	%cl, %r8
	movb	%r8b, (%r10,%rdi)
	incq	%rdi
	addl	$-8, %esi
	decl	%eax
	movq	%rdx, %rcx
	addq	%rdi, %rcx
	jne	.LBB9_9
# %bb.10:
	movsbq	1(%r14), %rax
	testq	%rax, %rax
	jle	.LBB9_13
# %bb.11:
	addq	%rax, %r10
	movsbq	(%r14), %rcx
	leaq	(%rsp,%rcx,8), %rdx
	addq	$48, %rdx
	movl	%eax, %esi
	negq	%rsi
	leal	-8(,%rax,8), %edi
	decl	%eax
	xorl	%r8d, %r8d
.LBB9_12:                               # =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	andl	$-8, %ecx
	movq	(%rdx,%rcx), %r9
	movl	%edi, %ecx
	andb	$56, %cl
	shrq	%cl, %r9
	movb	%r9b, (%r10,%r8)
	incq	%r8
	addl	$-8, %edi
	decl	%eax
	movq	%rsi, %rcx
	addq	%r8, %rcx
	jne	.LBB9_12
.LBB9_13:
	movl	%ebp, %eax
	addq	$120, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end9:
	.size	uECC_make_key, .Lfunc_end9-uECC_make_key
	.cfi_endproc
                                        # -- End function
	.type	uECC_generate_random_int,@function # -- Begin function uECC_generate_random_int
uECC_generate_random_int:               # @uECC_generate_random_int
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%edx, %ebx
	movq	%rdi, %r15
	movq	%rsi, 16(%rsp)                  # 8-byte Spill
	movq	%rsi, %rdi
	movl	%edx, %esi
	callq	uECC_vli_numBits
                                        # kill: def $ax killed $ax def $eax
	cmpq	$0, g_rng_function(%rip)
	je	.LBB10_10
# %bb.1:
	movsbl	%bl, %edx
	leal	(,%rdx,8), %ecx
	movl	%ecx, 4(%rsp)                   # 4-byte Spill
	movzbl	%dl, %r13d
	movl	%r13d, %ecx
	shll	$6, %ecx
	subl	%eax, %ecx
	movq	$-1, %r14
                                        # kill: def $cl killed $cl killed $ecx
	shrq	%cl, %r14
	movq	%rdx, 8(%rsp)                   # 8-byte Spill
	leal	-1(%rdx), %eax
	movslq	%eax, %r12
	xorl	%ebp, %ebp
.LBB10_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_5 Depth 2
	movq	%r15, %rdi
	movl	4(%rsp), %esi                   # 4-byte Reload
	callq	*g_rng_function(%rip)
	testl	%eax, %eax
	je	.LBB10_10
# %bb.3:                                #   in Loop: Header=BB10_2 Depth=1
	andq	%r14, (%r15,%r12,8)
	testb	%bl, %bl
	jle	.LBB10_9
# %bb.4:                                #   in Loop: Header=BB10_2 Depth=1
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB10_5:                               #   Parent Loop BB10_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	orq	(%r15,%rcx,8), %rax
	incq	%rcx
	cmpq	%rcx, %r13
	jne	.LBB10_5
# %bb.6:                                #   in Loop: Header=BB10_2 Depth=1
	testq	%rax, %rax
	je	.LBB10_9
# %bb.7:                                #   in Loop: Header=BB10_2 Depth=1
	movq	16(%rsp), %rdi                  # 8-byte Reload
	movq	%r15, %rsi
	movq	8(%rsp), %rdx                   # 8-byte Reload
                                        # kill: def $edx killed $edx killed $rdx
	callq	uECC_vli_cmp
	cmpb	$1, %al
	je	.LBB10_8
.LBB10_9:                               #   in Loop: Header=BB10_2 Depth=1
	incq	%rbp
	cmpq	$64, %rbp
	jne	.LBB10_2
.LBB10_10:
	xorl	%eax, %eax
.LBB10_11:
                                        # kill: def $eax killed $eax killed $rax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB10_8:
	.cfi_def_cfa_offset 80
	movl	$1, %eax
	jmp	.LBB10_11
.Lfunc_end10:
	.size	uECC_generate_random_int, .Lfunc_end10-uECC_generate_random_int
	.cfi_endproc
                                        # -- End function
	.type	EccPoint_compute_public_key,@function # -- Begin function EccPoint_compute_public_key
EccPoint_compute_public_key:            # @EccPoint_compute_public_key
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$88, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %rax
	movq	%rdi, %rbx
	leaq	48(%rsp), %rsi
	movq	%rsi, (%rsp)
	leaq	16(%rsp), %rdx
	movq	%rdx, 8(%rsp)
	movq	%rax, %rdi
	movq	%r14, %rcx
	callq	regularize_k
	movq	%rax, %r12
	cmpq	$0, g_rng_function(%rip)
	je	.LBB11_1
# %bb.6:
	movq	(%rsp,%r12,8), %r15
	leaq	8(%r14), %rsi
	movsbl	(%r14), %edx
	movq	%r15, %rdi
	callq	uECC_generate_random_int
	testl	%eax, %eax
	jne	.LBB11_2
	jmp	.LBB11_7
.LBB11_1:
	xorl	%r15d, %r15d
.LBB11_2:
	leaq	72(%r14), %rsi
	xorl	%eax, %eax
	testq	%r12, %r12
	sete	%al
	movq	(%rsp,%rax,8), %rdx
	movzwl	2(%r14), %eax
	incl	%eax
	movswl	%ax, %r8d
	movq	%rbx, %rdi
	movq	%r15, %rcx
	movq	%r14, %r9
	callq	EccPoint_mult
	movb	(%r14), %al
	addb	%al, %al
	testb	%al, %al
	jle	.LBB11_7
# %bb.3:
	movzbl	%al, %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.LBB11_4:                               # =>This Inner Loop Header: Depth=1
	orq	(%rbx,%rcx,8), %rdx
	incq	%rcx
	cmpq	%rcx, %rax
	jne	.LBB11_4
# %bb.5:
	xorl	%eax, %eax
	testq	%rdx, %rdx
	setne	%al
	jmp	.LBB11_8
.LBB11_7:
	xorl	%eax, %eax
.LBB11_8:
	addq	$88, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end11:
	.size	EccPoint_compute_public_key, .Lfunc_end11-EccPoint_compute_public_key
	.cfi_endproc
                                        # -- End function
	.globl	uECC_shared_secret              # -- Begin function uECC_shared_secret
	.type	uECC_shared_secret,@function
uECC_shared_secret:                     # @uECC_shared_secret
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rcx, %rbx
	movq	%rdx, %r14
	movq	%rdi, %rbp
	leaq	128(%rsp), %rax
	movq	%rax, (%rsp)
	movq	%rax, %rdi
	leaq	96(%rsp), %rax
	movq	%rax, 8(%rsp)
	movsbq	(%rcx), %r15
	movsbq	1(%rcx), %r12
	movswl	2(%rcx), %r13d
	leal	7(%r13), %eax
	leal	14(%r13), %edx
	testl	%eax, %eax
	cmovnsl	%eax, %edx
	sarl	$3, %edx
	callq	uECC_vli_bytesToNative
	leaq	32(%rsp), %rdi
	movq	%rbp, %rsi
	movl	%r12d, %edx
	callq	uECC_vli_bytesToNative
	movq	%r15, 24(%rsp)                  # 8-byte Spill
	leaq	(%rsp,%r15,8), %rdi
	addq	$32, %rdi
	addq	%r12, %rbp
	movq	%rbp, %rsi
	movl	%r12d, %edx
	callq	uECC_vli_bytesToNative
	leaq	128(%rsp), %rdi
	movq	%rdi, %rsi
	leaq	96(%rsp), %rdx
	movq	%rbx, %rcx
	callq	regularize_k
	movq	%rax, %rbp
	cmpq	$0, g_rng_function(%rip)
	je	.LBB12_1
# %bb.2:
	movq	(%rsp,%rbp,8), %r15
	leaq	8(%rbx), %rsi
	movsbl	24(%rsp), %edx                  # 1-byte Folded Reload
	movq	%r15, %rdi
	callq	uECC_generate_random_int
	testl	%eax, %eax
	je	.LBB12_3
# %bb.4:
	movzwl	2(%rbx), %r13d
	jmp	.LBB12_5
.LBB12_1:
	xorl	%r15d, %r15d
.LBB12_5:
	xorl	%eax, %eax
	testq	%rbp, %rbp
	sete	%al
	movq	(%rsp,%rax,8), %rdx
	incl	%r13d
	movswl	%r13w, %r8d
	leaq	32(%rsp), %rdi
	movq	%rdi, %rsi
	movq	%r15, %rcx
	movq	%rbx, %r9
	callq	EccPoint_mult
	testb	%r12b, %r12b
	jle	.LBB12_8
# %bb.6:
	movl	%r12d, %eax
	negq	%rax
	leal	-8(,%r12,8), %edx
	leal	-1(%r12), %esi
	xorl	%edi, %edi
.LBB12_7:                               # =>This Inner Loop Header: Depth=1
	movl	%esi, %ecx
	andl	$-8, %ecx
	movq	32(%rsp,%rcx), %r8
	movl	%edx, %ecx
	andb	$56, %cl
	shrq	%cl, %r8
	movb	%r8b, (%r14,%rdi)
	incq	%rdi
	addl	$-8, %edx
	decl	%esi
	movq	%rax, %rcx
	addq	%rdi, %rcx
	jne	.LBB12_7
.LBB12_8:
	movb	(%rbx), %cl
	addb	%cl, %cl
	testb	%cl, %cl
	movl	$0, %eax
	jle	.LBB12_12
# %bb.9:
	movzbl	%cl, %eax
	pxor	%xmm0, %xmm0
	xorl	%ecx, %ecx
.LBB12_10:                              # =>This Inner Loop Header: Depth=1
	por	32(%rsp,%rcx,8), %xmm0
	addq	$2, %rcx
	cmpq	%rcx, %rax
	jne	.LBB12_10
# %bb.11:
	pxor	%xmm1, %xmm1
	pcmpeqb	%xmm1, %xmm0
	pmovmskb	%xmm0, %ecx
	xorl	%eax, %eax
	cmpl	$65535, %ecx                    # imm = 0xFFFF
	setne	%al
	jmp	.LBB12_12
.LBB12_3:
	xorl	%eax, %eax
.LBB12_12:
                                        # kill: def $eax killed $eax killed $rax
	addq	$168, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end12:
	.size	uECC_shared_secret, .Lfunc_end12-uECC_shared_secret
	.cfi_endproc
                                        # -- End function
	.type	uECC_vli_bytesToNative,@function # -- Begin function uECC_vli_bytesToNative
uECC_vli_bytesToNative:                 # @uECC_vli_bytesToNative
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	%edx, %r15d
	movq	%rsi, %rbx
	movq	%rdi, %r14
	leal	7(%r15), %ecx
	leal	14(%r15), %eax
	testl	%ecx, %ecx
	cmovnsl	%ecx, %eax
	sarl	$3, %eax
	testb	%al, %al
	jle	.LBB13_2
# %bb.1:
	movzbl	%al, %edx
	shll	$3, %edx
	movq	%r14, %rdi
	xorl	%esi, %esi
	callq	memset@PLT
.LBB13_2:
	testl	%r15d, %r15d
	jle	.LBB13_5
# %bb.3:
	movl	%r15d, %eax
	movl	%r15d, %edx
	decl	%edx
	leal	-8(,%r15,8), %esi
	xorl	%edi, %edi
.LBB13_4:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%rbx,%rdi), %r8d
	movl	%esi, %ecx
	andb	$56, %cl
	shlq	%cl, %r8
	movl	%edx, %ecx
	andl	$-8, %ecx
	orq	%r8, (%r14,%rcx)
	incq	%rdi
	decl	%edx
	addl	$-8, %esi
	cmpq	%rdi, %rax
	jne	.LBB13_4
.LBB13_5:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end13:
	.size	uECC_vli_bytesToNative, .Lfunc_end13-uECC_vli_bytesToNative
	.cfi_endproc
                                        # -- End function
	.type	regularize_k,@function          # -- Begin function regularize_k
regularize_k:                           # @regularize_k
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movswl	2(%rcx), %r9d
	leal	63(%r9), %eax
	leal	126(%r9), %r8d
	testl	%eax, %eax
	cmovnsl	%eax, %r8d
	sarl	$6, %r8d
	testb	%r8b, %r8b
	jle	.LBB14_4
# %bb.1:
	movzbl	%r8b, %eax
	xorl	%r10d, %r10d
	xorl	%r11d, %r11d
.LBB14_2:                               # =>This Inner Loop Header: Depth=1
	movq	%r11, %rbx
	movq	(%rdi,%r10,8), %r14
	leaq	(%r14,%r11), %r15
	addq	40(%rcx,%r10,8), %r15
	xorl	%r11d, %r11d
	cmpq	%r14, %r15
	setb	%r11b
	cmoveq	%rbx, %r11
	movq	%r15, (%rsi,%r10,8)
	incq	%r10
	cmpq	%r10, %rax
	jne	.LBB14_2
# %bb.3:
	movl	$1, %eax
	testq	%r11, %r11
	jne	.LBB14_7
.LBB14_4:
	movsbl	%r8b, %eax
	shll	$6, %eax
	cmpl	%r9d, %eax
	jle	.LBB14_5
# %bb.6:
	movl	%r9d, %eax
	sarl	$6, %eax
	cltq
	movq	(%rsi,%rax,8), %rdi
	xorl	%eax, %eax
	btq	%r9, %rdi
	setb	%al
	jmp	.LBB14_7
.LBB14_5:
	xorl	%eax, %eax
.LBB14_7:
	testb	%r8b, %r8b
	jle	.LBB14_10
# %bb.8:
	movzbl	%r8b, %edi
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
.LBB14_9:                               # =>This Inner Loop Header: Depth=1
	movq	(%rsi,%r8,8), %r10
	leaq	(%r10,%r9), %r11
	addq	40(%rcx,%r8,8), %r11
	xorl	%ebx, %ebx
	cmpq	%r10, %r11
	setb	%bl
	cmovneq	%rbx, %r9
	movq	%r11, (%rdx,%r8,8)
	incq	%r8
	cmpq	%r8, %rdi
	jne	.LBB14_9
.LBB14_10:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end14:
	.size	regularize_k, .Lfunc_end14-regularize_k
	.cfi_endproc
                                        # -- End function
	.type	EccPoint_mult,@function         # -- Begin function EccPoint_mult
EccPoint_mult:                          # @EccPoint_mult
	.cfi_startproc
# %bb.0:                                # Block address taken
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushq	%rbp
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	jmp	.LBB15_19
.LBB15_19:                              # Block address taken
                                        # Label of block must be emitted
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$312, %rsp                      # imm = 0x138
	.cfi_def_cfa_offset 368
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	jmp	.LBB15_20
.LBB15_20:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_offset %r13, -40
	jmp	.LBB15_80
.LBB15_78:                              # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	retq
.LBB15_80:                              # Block address taken
                                        # Label of block must be emitted
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_42
.LBB15_43:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	.cfi_offset %rbp, -16
	movq	%r9, %r15
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_45
.LBB15_46:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	movq	%rdx, 8(%rsp)                   # 8-byte Spill
	jmp	.LBB15_21
.LBB15_21:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rdi, 40(%rsp)                  # 8-byte Spill
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_48
.LBB15_49:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	leaq	112(%rsp), %rdi
	testq	%rax, %rax
	jmp	.LBB15_53
.LBB15_51:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rsi, %rbp
	movq	%r12, %rdx
	retq
.LBB15_53:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rax, 72(%rsp)                  # 8-byte Spill
	movq	%rsi, 64(%rsp)                  # 8-byte Spill
	jle	.LBB15_2
.LBB15_1:                               # Block address taken
                                        # Label of block must be emitted
	leaq	(,%rbx,8), %r12
	jmp	.LBB15_74
.LBB15_72:                              # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	shlq	$5, %rcx
	retq
.LBB15_74:                              # Block address taken
                                        # Label of block must be emitted
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_51
.LBB15_52:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	callq	memcpy@PLT
	leaq	(,%rbx,8), %rsi
	addq	%rbp, %rsi
	leaq	176(%rsp), %rbp
	movq	%rbp, %rdi
	jmp	.LBB15_22
.LBB15_2:                               # Block address taken
                                        # Label of block must be emitted
	leaq	176(%rsp), %rbp
	leaq	(%rsi,%rax,8), %rcx
	movq	%rcx, 24(%rsp)                  # 8-byte Spill
	movq	%rax, 16(%rsp)                  # 8-byte Spill
.LBB15_3:                               # Block address taken
                                        # Label of block must be emitted
	movzbl	(%r15), %r12d
	testq	%r14, %r14
	movq	%rbx, 32(%rsp)                  # 8-byte Spill
	je	.LBB15_6
.LBB15_4:                               # Block address taken
                                        # Label of block must be emitted
	testb	%r12b, %r12b
	jmp	.LBB15_98
.LBB15_96:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdi
	movq	%rbx, %rsi
	retq
.LBB15_98:                              # Block address taken
                                        # Label of block must be emitted
	jle	.LBB15_9
.LBB15_5:                               # Block address taken
                                        # Label of block must be emitted
	shlq	$3, %r12
	jmp	.LBB15_83
.LBB15_81:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	andl	$1, %eax
	movq	%rax, %rcx
	retq
.LBB15_83:                              # Block address taken
                                        # Label of block must be emitted
	leaq	208(%rsp), %rdi
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_54
.LBB15_55:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	jmp	.LBB15_68
.LBB15_66:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	retq
.LBB15_68:                              # Block address taken
                                        # Label of block must be emitted
	callq	memcpy@PLT
	jmp	.LBB15_8
.LBB15_6:                               # Block address taken
                                        # Label of block must be emitted
	testb	%r12b, %r12b
	jle	.LBB15_10
.LBB15_7:                               # Block address taken
                                        # Label of block must be emitted
	shlq	$3, %r12
	leaq	208(%rsp), %r14
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_57
.LBB15_58:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	movq	%r12, %rdx
	callq	memset@PLT
	movq	$1, (%r14)
.LBB15_8:                               # Block address taken
                                        # Label of block must be emitted
	leaq	112(%rsp), %rbx
	leaq	80(%rsp), %rdi
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_60
.LBB15_61:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	callq	memmove@PLT
	leaq	176(%rsp), %rsi
	leaq	144(%rsp), %rdi
	movq	%r12, %rdx
	jmp	.LBB15_23
.LBB15_40:                              # Block address taken
                                        # Label of block must be emitted
	leaq	(%rbx,%rax,8), %rdi
	jmp	.LBB15_95
.LBB15_93:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdi
	movq	%rbx, %rsi
	retq
.LBB15_95:                              # Block address taken
                                        # Label of block must be emitted
	leaq	144(%rsp), %rsi
	jmp	.LBB15_47
.LBB15_45:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movl	%r8d, %r13d
	movq	%rcx, %r14
	retq
.LBB15_47:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r14, %rdx
	callq	memcpy@PLT
	jmp	.LBB15_18
.LBB15_23:                              # Block address taken
                                        # Label of block must be emitted
	callq	memmove@PLT
	jmp	.LBB15_12
.LBB15_22:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rsi, 24(%rsp)                  # 8-byte Spill
	movq	%r12, %rdx
	callq	memcpy@PLT
	movq	%rbx, 16(%rsp)                  # 8-byte Spill
	jmp	.LBB15_3
.LBB15_9:                               # Block address taken
                                        # Label of block must be emitted
	jmp	.LBB15_11
.LBB15_10:                              # Block address taken
                                        # Label of block must be emitted
	movq	$1, 208(%rsp)
.LBB15_11:                              # Block address taken
                                        # Label of block must be emitted
	leaq	112(%rsp), %rbx
.LBB15_12:                              # Block address taken
                                        # Label of block must be emitted
	leaq	208(%rsp), %r14
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_63
.LBB15_64:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	movq	%r14, %rdx
	movq	%r15, %rcx
	callq	apply_z
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_66
.LBB15_67:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	jmp	.LBB15_24
.LBB15_24:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r14, %rdx
	movq	%r15, %rcx
	callq	*168(%r15)
	leaq	80(%rsp), %rdi
	leaq	144(%rsp), %rsi
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_69
.LBB15_70:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	callq	apply_z
	jmp	.LBB15_25
.LBB15_25:                              # Block address taken
                                        # Label of block must be emitted
	addl	$-2, %r13d
	jmp	.LBB15_101
.LBB15_99:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r13, %rcx
	movq	%r15, %r8
	retq
.LBB15_101:                             # Block address taken
                                        # Label of block must be emitted
	testw	%r13w, %r13w
	jmp	.LBB15_44
.LBB15_42:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	retq
.LBB15_44:                              # Block address taken
                                        # Label of block must be emitted
	movq	8(%rsp), %rbx                   # 8-byte Reload
	jle	.LBB15_15
.LBB15_13:                              # Block address taken
                                        # Label of block must be emitted
	movzwl	%r13w, %r14d
.LBB15_14:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movl	%r14d, %eax
	shrl	$6, %eax
	jmp	.LBB15_71
.LBB15_69:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdx
	movq	%r15, %rcx
	retq
.LBB15_71:                              # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	movl	$1, %edx
	movl	%r14d, %ecx
	jmp	.LBB15_65
.LBB15_63:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	retq
.LBB15_65:                              # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	shlq	%cl, %rdx
	xorl	%ecx, %ecx
	jmp	.LBB15_89
.LBB15_87:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rcx
	movl	%ebp, %r8d
	retq
.LBB15_89:                              # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	xorl	%esi, %esi
	testq	%rdx, (%rbx,%rax,8)
	jmp	.LBB15_26
.LBB15_26:                              # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	setne	%cl
	jmp	.LBB15_104
.LBB15_102:                             # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rdi
	movq	%r14, %rdx
	retq
.LBB15_104:                             # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	sete	%sil
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_72
.LBB15_73:                              # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	leaq	(%rsp,%rcx), %r12
	addq	$80, %r12
	leaq	(%rsp,%rcx), %r13
	addq	$144, %r13
	shlq	$5, %rsi
	jmp	.LBB15_27
.LBB15_27:                              # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	leaq	(%rsp,%rsi), %rbp
	addq	$80, %rbp
	leaq	144(%rsp,%rsi), %rbx
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_75
.LBB15_76:                              # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%r15, %r8
	jmp	.LBB15_28
.LBB15_28:                              # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	callq	XYcZ_addC
	jmp	.LBB15_92
.LBB15_90:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdi
	movq	%rbx, %rsi
	retq
.LBB15_92:                              # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_78
.LBB15_79:                              # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	movq	%r12, %rdx
	movq	8(%rsp), %rbx                   # 8-byte Reload
	movq	%r13, %rcx
	movq	%r15, %r8
	callq	XYcZ_add
	jmp	.LBB15_29
.LBB15_29:                              # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	leal	-1(%r14), %eax
	cmpl	$1, %r14d
	movl	%eax, %r14d
	ja	.LBB15_14
.LBB15_15:                              # Block address taken
                                        # Label of block must be emitted
	movq	(%rbx), %rax
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_81
.LBB15_82:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	xorq	$1, %rcx
	shlq	$5, %rax
	leaq	(%rsp,%rax), %rdi
	addq	$80, %rdi
	movq	%rdi, 48(%rsp)                  # 8-byte Spill
	jmp	.LBB15_30
.LBB15_30:                              # Block address taken
                                        # Label of block must be emitted
	leaq	(%rsp,%rax), %r13
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_84
.LBB15_85:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	leaq	(%rsp,%rcx), %rdx
	jmp	.LBB15_62
.LBB15_60:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rsi
	movq	%r12, %rdx
	retq
.LBB15_62:                              # Block address taken
                                        # Label of block must be emitted
	addq	$80, %rdx
	movq	%rdx, 8(%rsp)                   # 8-byte Spill
	leaq	144(%rsp,%rcx), %rcx
	movq	%rcx, 56(%rsp)                  # 8-byte Spill
	jmp	.LBB15_31
.LBB15_31:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r13, %rsi
	movq	%r15, %r8
	callq	XYcZ_addC
	leaq	8(%r15), %r12
	movsbl	32(%rsp), %ebp                  # 1-byte Folded Reload
	leaq	272(%rsp), %r14
	leaq	80(%rsp), %rdx
	movq	%r14, %rdi
	jmp	.LBB15_32
.LBB15_32:                              # Block address taken
                                        # Label of block must be emitted
	leaq	112(%rsp), %rsi
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_87
.LBB15_88:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	callq	uECC_vli_modSub
	jmp	.LBB15_86
.LBB15_84:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	$144, %r13
	shlq	$5, %rcx
	retq
.LBB15_86:                              # Block address taken
                                        # Label of block must be emitted
	movsbl	(%r15), %ecx
	leaq	208(%rsp), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rsi
	jmp	.LBB15_33
.LBB15_33:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r13, %rdx
	callq	uECC_vli_mult
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_90
.LBB15_91:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	callq	*192(%r15)
	movsbl	(%r15), %ecx
	leaq	208(%rsp), %rbx
	movq	%rbx, %rdi
	jmp	.LBB15_34
.LBB15_34:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r14, %rsi
	movq	64(%rsp), %rdx                  # 8-byte Reload
	callq	uECC_vli_mult
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_93
.LBB15_94:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	callq	*192(%r15)
	movq	%r14, %rdi
	movq	%r14, %rsi
	jmp	.LBB15_35
.LBB15_35:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r12, %rdx
	movl	%ebp, %ecx
	callq	uECC_vli_modInv
	movsbl	(%r15), %ecx
	jmp	.LBB15_77
.LBB15_75:                              # Block address taken
                                        #   in Loop: Header=BB15_14 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rdi
	movq	%r13, %rsi
	retq
.LBB15_77:                              # Block address taken
                                        # Label of block must be emitted
	leaq	208(%rsp), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rsi
	movq	24(%rsp), %rdx                  # 8-byte Reload
	jmp	.LBB15_36
.LBB15_36:                              # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_mult
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_96
.LBB15_97:                              # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	callq	*192(%r15)
	movsbl	(%r15), %ecx
	leaq	208(%rsp), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rsi
	jmp	.LBB15_37
.LBB15_37:                              # Block address taken
                                        # Label of block must be emitted
	movq	48(%rsp), %r12                  # 8-byte Reload
	movq	%r12, %rdx
	callq	uECC_vli_mult
	movq	%r14, %rdi
	jmp	.LBB15_50
.LBB15_48:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movsbq	(%r9), %rax
	movzbl	%al, %ebx
	retq
.LBB15_50:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbx, %rsi
	callq	*192(%r15)
	movq	8(%rsp), %rdi                   # 8-byte Reload
	movq	56(%rsp), %rsi                  # 8-byte Reload
	jmp	.LBB15_38
.LBB15_38:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r12, %rdx
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_99
.LBB15_100:                             # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	callq	XYcZ_add
	jmp	.LBB15_59
.LBB15_57:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdi
	xorl	%esi, %esi
	retq
.LBB15_59:                              # Block address taken
                                        # Label of block must be emitted
	leaq	144(%rsp), %rsi
	leaq	80(%rsp), %rdi
	movq	%r14, %rdx
	movq	%r15, %rcx
	jmp	.LBB15_39
.LBB15_39:                              # Block address taken
                                        # Label of block must be emitted
	callq	apply_z
	cmpb	$0, 72(%rsp)                    # 1-byte Folded Reload
	jle	.LBB15_17
.LBB15_16:                              # Block address taken
                                        # Label of block must be emitted
	movq	32(%rsp), %r14                  # 8-byte Reload
	shlq	$3, %r14
	leaq	80(%rsp), %rsi
	movq	40(%rsp), %rbx                  # 8-byte Reload
	subq	$368, %rsp                      # imm = 0x170
	callq	.LBB15_102
.LBB15_103:                             # Block address taken
                                        # Label of block must be emitted
	addq	$368, %rsp                      # imm = 0x170
	callq	memcpy@PLT
	movq	16(%rsp), %rax                  # 8-byte Reload
	jmp	.LBB15_40
.LBB15_17:                              # Block address taken
                                        # Label of block must be emitted
.LBB15_18:                              # Block address taken
                                        # Label of block must be emitted
	addq	$312, %rsp                      # imm = 0x138
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	jmp	.LBB15_56
.LBB15_54:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rsi
	movq	%r12, %rdx
	retq
.LBB15_56:                              # Block address taken
                                        # Label of block must be emitted
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	jmp	.LBB15_41
.LBB15_41:                              # Block address taken
                                        # Label of block must be emitted
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	popq	%rbp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	retq
.Lfunc_end15:
	.size	EccPoint_mult, .Lfunc_end15-EccPoint_mult
	.cfi_endproc
                                        # -- End function
	.globl	uECC_compress                   # -- Begin function uECC_compress
	.type	uECC_compress,@function
uECC_compress:                          # @uECC_compress
	.cfi_startproc
# %bb.0:
	movb	1(%rdx), %al
	testb	%al, %al
	jle	.LBB16_3
# %bb.1:
	xorl	%ecx, %ecx
.LBB16_2:                               # =>This Inner Loop Header: Depth=1
	movb	(%rdi,%rcx), %al
	movb	%al, 1(%rsi,%rcx)
	incq	%rcx
	movsbq	1(%rdx), %rax
	cmpq	%rax, %rcx
	jl	.LBB16_2
.LBB16_3:
	movsbq	%al, %rax
	movb	-1(%rdi,%rax,2), %al
	andb	$1, %al
	orb	$2, %al
	movb	%al, (%rsi)
	retq
.Lfunc_end16:
	.size	uECC_compress, .Lfunc_end16-uECC_compress
	.cfi_endproc
                                        # -- End function
	.globl	uECC_decompress                 # -- Begin function uECC_decompress
	.type	uECC_decompress,@function
uECC_decompress:                        # @uECC_decompress
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$64, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %r15
	movq	%rsi, %rbx
	movq	%rdi, %r12
	movsbq	(%rdx), %rax
	leaq	(%rsp,%rax,8), %r14
	leaq	1(%rdi), %rsi
	movsbl	1(%rdx), %edx
	movq	%rsp, %r13
	movq	%r13, %rdi
	callq	uECC_vli_bytesToNative
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%r15, %rdx
	callq	*184(%r15)
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	*176(%r15)
	movq	(%r14), %rax
	andl	$1, %eax
	movzbl	(%r12), %ecx
	andl	$1, %ecx
	cmpq	%rcx, %rax
	je	.LBB17_4
# %bb.1:
	movzbl	(%r15), %eax
	testb	%al, %al
	jle	.LBB17_4
# %bb.2:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.LBB17_3:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15,%rcx,8), %rsi
	movq	(%r14,%rcx,8), %rdi
	addq	%rdx, %rdi
	xorl	%r8d, %r8d
	subq	%rdi, %rsi
	setb	%r8b
	testq	%rdi, %rdi
	cmovneq	%r8, %rdx
	movq	%rsi, (%r14,%rcx,8)
	incq	%rcx
	cmpq	%rcx, %rax
	jne	.LBB17_3
.LBB17_4:
	movsbl	1(%r15), %eax
	testl	%eax, %eax
	jle	.LBB17_10
# %bb.5:
	movl	%eax, %edx
	negq	%rdx
	leal	-8(,%rax,8), %esi
	decl	%eax
	xorl	%edi, %edi
.LBB17_6:                               # =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	andl	$-8, %ecx
	movq	(%rsp,%rcx), %r8
	movl	%esi, %ecx
	andb	$56, %cl
	shrq	%cl, %r8
	movb	%r8b, (%rbx,%rdi)
	incq	%rdi
	addl	$-8, %esi
	decl	%eax
	movq	%rdx, %rcx
	addq	%rdi, %rcx
	jne	.LBB17_6
# %bb.7:
	movsbq	1(%r15), %rax
	testq	%rax, %rax
	jle	.LBB17_10
# %bb.8:
	addq	%rax, %rbx
	movl	%eax, %edx
	negq	%rdx
	leal	-8(,%rax,8), %esi
	decl	%eax
	xorl	%edi, %edi
.LBB17_9:                               # =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	andl	$-8, %ecx
	movq	(%r14,%rcx), %r8
	movl	%esi, %ecx
	andb	$56, %cl
	shrq	%cl, %r8
	movb	%r8b, (%rbx,%rdi)
	incq	%rdi
	addl	$-8, %esi
	decl	%eax
	movq	%rdx, %rcx
	addq	%rdi, %rcx
	jne	.LBB17_9
.LBB17_10:
	addq	$64, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end17:
	.size	uECC_decompress, .Lfunc_end17-uECC_decompress
	.cfi_endproc
                                        # -- End function
	.globl	uECC_valid_public_key           # -- Begin function uECC_valid_public_key
	.type	uECC_valid_public_key,@function
uECC_valid_public_key:                  # @uECC_valid_public_key
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$160, %rsp
	.cfi_def_cfa_offset 208
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, %r15
	movsbq	1(%rsi), %r12
	movq	%rsp, %rdi
	movq	%r15, %rsi
	movl	%r12d, %edx
	callq	uECC_vli_bytesToNative
	movsbq	(%rbx), %r13
	leaq	(%rsp,%r13,8), %r14
	addq	%r12, %r15
	movq	%r14, %rdi
	movq	%r15, %rsi
	movl	%r12d, %edx
	callq	uECC_vli_bytesToNative
	leal	(%r13,%r13), %eax
	testb	%al, %al
	jle	.LBB18_1
# %bb.2:
	movzbl	%al, %eax
	pxor	%xmm0, %xmm0
	xorl	%ecx, %ecx
.LBB18_3:                               # =>This Inner Loop Header: Depth=1
	por	(%rsp,%rcx,8), %xmm0
	addq	$2, %rcx
	cmpq	%rcx, %rax
	jne	.LBB18_3
# %bb.4:
	pxor	%xmm1, %xmm1
	pcmpeqb	%xmm1, %xmm0
	pmovmskb	%xmm0, %ecx
	xorl	%eax, %eax
	cmpl	$65535, %ecx                    # imm = 0xFFFF
	je	.LBB18_18
# %bb.5:
	leal	-1(%r13), %ecx
.LBB18_6:                               # =>This Inner Loop Header: Depth=1
	testb	%cl, %cl
	js	.LBB18_18
# %bb.7:                                #   in Loop: Header=BB18_6 Depth=1
	movzbl	%cl, %esi
	movq	8(%rbx,%rsi,8), %rdx
	movq	(%rsp,%rsi,8), %rsi
	cmpq	%rsi, %rdx
	ja	.LBB18_8
# %bb.12:                               #   in Loop: Header=BB18_6 Depth=1
	decb	%cl
	cmpq	%rsi, %rdx
	jae	.LBB18_6
	jmp	.LBB18_18
.LBB18_1:
	xorl	%eax, %eax
.LBB18_18:
	addq	$160, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB18_8:
	.cfi_def_cfa_offset 208
	leal	-1(%r13), %ecx
.LBB18_9:                               # =>This Inner Loop Header: Depth=1
	testb	%cl, %cl
	js	.LBB18_18
# %bb.10:                               #   in Loop: Header=BB18_9 Depth=1
	movzbl	%cl, %esi
	movq	8(%rbx,%rsi,8), %rdx
	movq	(%r14,%rsi,8), %rsi
	cmpq	%rsi, %rdx
	ja	.LBB18_13
# %bb.11:                               #   in Loop: Header=BB18_9 Depth=1
	decb	%cl
	cmpq	%rsi, %rdx
	jae	.LBB18_9
	jmp	.LBB18_18
.LBB18_13:
	movsbl	%r13b, %ecx
	leaq	96(%rsp), %r15
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%r14, %rdx
	callq	uECC_vli_mult
	leaq	64(%rsp), %rdi
	movq	%r15, %rsi
	callq	*192(%rbx)
	leaq	96(%rsp), %rdi
	movq	%rsp, %rsi
	movq	%rbx, %rdx
	callq	*184(%rbx)
	decb	%r13b
	js	.LBB18_14
# %bb.15:
	movzbl	%r13b, %eax
	xorl	%ecx, %ecx
.LBB18_16:                              # =>This Inner Loop Header: Depth=1
	movq	96(%rsp,%rax,8), %rdx
	xorq	64(%rsp,%rax,8), %rdx
	orq	%rdx, %rcx
	addq	$-1, %rax
	jb	.LBB18_16
# %bb.17:
	xorl	%eax, %eax
	testq	%rcx, %rcx
	sete	%al
	jmp	.LBB18_18
.LBB18_14:
	movl	$1, %eax
	jmp	.LBB18_18
.Lfunc_end18:
	.size	uECC_valid_public_key, .Lfunc_end18-uECC_valid_public_key
	.cfi_endproc
                                        # -- End function
	.globl	uECC_compute_public_key         # -- Begin function uECC_compute_public_key
	.type	uECC_compute_public_key,@function
uECC_compute_public_key:                # @uECC_compute_public_key
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %r14
	movq	%rsi, %rbx
	movq	%rdi, %rsi
	movswl	2(%rdx), %r15d
	leal	7(%r15), %eax
	leal	14(%r15), %edx
	testl	%eax, %eax
	cmovnsl	%eax, %edx
	sarl	$3, %edx
	movq	%rsp, %rdi
	callq	uECC_vli_bytesToNative
	leal	63(%r15), %eax
	addl	$126, %r15d
	testl	%eax, %eax
	cmovnsl	%eax, %r15d
	sarl	$6, %r15d
	testb	%r15b, %r15b
	jle	.LBB19_1
# %bb.2:
	movzbl	%r15b, %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.LBB19_3:                               # =>This Inner Loop Header: Depth=1
	orq	(%rsp,%rcx,8), %rdx
	incq	%rcx
	cmpq	%rcx, %rax
	jne	.LBB19_3
# %bb.4:
	xorl	%ebp, %ebp
	testq	%rdx, %rdx
	je	.LBB19_13
# %bb.5:
	leaq	40(%r14), %rdi
	movsbl	%r15b, %edx
	movq	%rsp, %rsi
	callq	uECC_vli_cmp
	cmpb	$1, %al
	jne	.LBB19_13
# %bb.6:
	leaq	32(%rsp), %rdi
	movq	%rsp, %rsi
	movq	%r14, %rdx
	callq	EccPoint_compute_public_key
	testq	%rax, %rax
	je	.LBB19_13
# %bb.7:
	movsbl	1(%r14), %eax
	movl	$1, %ebp
	testl	%eax, %eax
	jle	.LBB19_13
# %bb.8:
	movl	%eax, %edx
	negq	%rdx
	leal	-8(,%rax,8), %esi
	decl	%eax
	xorl	%edi, %edi
.LBB19_9:                               # =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	andl	$-8, %ecx
	movq	32(%rsp,%rcx), %r8
	movl	%esi, %ecx
	andb	$56, %cl
	shrq	%cl, %r8
	movb	%r8b, (%rbx,%rdi)
	incq	%rdi
	addl	$-8, %esi
	decl	%eax
	movq	%rdx, %rcx
	addq	%rdi, %rcx
	jne	.LBB19_9
# %bb.10:
	movsbq	1(%r14), %rax
	testq	%rax, %rax
	jle	.LBB19_13
# %bb.11:
	addq	%rax, %rbx
	movsbq	(%r14), %rcx
	leaq	(%rsp,%rcx,8), %rdx
	addq	$32, %rdx
	movl	%eax, %esi
	negq	%rsi
	leal	-8(,%rax,8), %edi
	decl	%eax
	xorl	%r8d, %r8d
.LBB19_12:                              # =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	andl	$-8, %ecx
	movq	(%rdx,%rcx), %r9
	movl	%edi, %ecx
	andb	$56, %cl
	shrq	%cl, %r9
	movb	%r9b, (%rbx,%r8)
	incq	%r8
	addl	$-8, %edi
	decl	%eax
	movq	%rsi, %rcx
	addq	%r8, %rcx
	jne	.LBB19_12
	jmp	.LBB19_13
.LBB19_1:
	xorl	%ebp, %ebp
.LBB19_13:
	movl	%ebp, %eax
	addq	$104, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end19:
	.size	uECC_compute_public_key, .Lfunc_end19-uECC_compute_public_key
	.cfi_endproc
                                        # -- End function
	.type	uECC_vli_cmp,@function          # -- Begin function uECC_vli_cmp
uECC_vli_cmp:                           # @uECC_vli_cmp
	.cfi_startproc
# %bb.0:
	testb	%dl, %dl
	jle	.LBB20_1
# %bb.2:
	movzbl	%dl, %eax
	xorl	%edx, %edx
	xorl	%ecx, %ecx
.LBB20_3:                               # =>This Inner Loop Header: Depth=1
	movq	(%rdi,%rdx,8), %r8
	movq	(%rsi,%rdx,8), %r9
	addq	%rcx, %r9
	xorl	%r10d, %r10d
	subq	%r9, %r8
	setb	%r10b
	testq	%r9, %r9
	cmovneq	%r10, %rcx
	movq	%r8, -40(%rsp,%rdx,8)
	incq	%rdx
	cmpq	%rdx, %rax
	jne	.LBB20_3
# %bb.4:
	xorl	%edx, %edx
	xorl	%esi, %esi
.LBB20_5:                               # =>This Inner Loop Header: Depth=1
	orq	-40(%rsp,%rdx,8), %rsi
	incq	%rdx
	cmpq	%rdx, %rax
	jne	.LBB20_5
# %bb.6:
	testq	%rsi, %rsi
	setne	%al
	movb	$-2, %dl
	testq	%rcx, %rcx
	jne	.LBB20_8
	jmp	.LBB20_7
.LBB20_1:
	xorl	%eax, %eax
.LBB20_7:
	xorl	%edx, %edx
.LBB20_8:
	orb	%dl, %al
                                        # kill: def $al killed $al killed $eax
	retq
.Lfunc_end20:
	.size	uECC_vli_cmp, .Lfunc_end20-uECC_vli_cmp
	.cfi_endproc
                                        # -- End function
	.globl	uECC_sign_with_k                # -- Begin function uECC_sign_with_k
	.type	uECC_sign_with_k,@function
uECC_sign_with_k:                       # @uECC_sign_with_k
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r9, %rbx
	movq	%r8, %r14
	movl	%edx, %ebp
	movq	%rsi, %r15
	movq	%rdi, %r12
	movswl	2(%r9), %edx
	leal	7(%rdx), %eax
	addl	$14, %edx
	testl	%eax, %eax
	cmovnsl	%eax, %edx
	sarl	$3, %edx
	movq	%rsp, %r13
	movq	%r13, %rdi
	movq	%rcx, %rsi
                                        # kill: def $edx killed $edx killed $rdx
	movq	%r9, %rcx
	callq	bits2int
	movq	%r12, %rdi
	movq	%r15, %rsi
	movl	%ebp, %edx
	movq	%r13, %rcx
	movq	%r14, %r8
	movq	%rbx, %r9
	callq	uECC_sign_with_k_internal
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end21:
	.size	uECC_sign_with_k, .Lfunc_end21-uECC_sign_with_k
	.cfi_endproc
                                        # -- End function
	.type	bits2int,@function              # -- Begin function bits2int
bits2int:                               # @bits2int
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rcx, %rbx
	movq	%rsi, %r12
	movswl	2(%rcx), %ebp
	leal	7(%rbp), %eax
	leal	14(%rbp), %r15d
	testl	%eax, %eax
	cmovnsl	%eax, %r15d
	movq	%rdi, %r14
	sarl	$3, %r15d
	leal	63(%rbp), %r13d
	addl	$126, %ebp
	testl	%r13d, %r13d
	cmovsl	%ebp, %r13d
	sarl	$6, %r13d
	cmpl	%edx, %r15d
	cmovael	%edx, %r15d
	testb	%r13b, %r13b
	jle	.LBB22_2
# %bb.1:
	movzbl	%r13b, %edx
	shll	$3, %edx
	movq	%r14, %rdi
	xorl	%esi, %esi
	callq	memset@PLT
.LBB22_2:
	movq	%r14, %rdi
	movq	%r12, %rsi
	movl	%r15d, %edx
	callq	uECC_vli_bytesToNative
	shll	$3, %r15d
	movswl	2(%rbx), %eax
	subl	%eax, %r15d
	jbe	.LBB22_13
# %bb.3:
	cmpl	$127, %ebp
	jb	.LBB22_6
# %bb.4:
	movl	%r13d, %eax
	leaq	(%r14,%rax,8), %rdx
	movl	$64, %eax
	subl	%r15d, %eax
	xorl	%esi, %esi
.LBB22_5:                               # =>This Inner Loop Header: Depth=1
	movq	-8(%rdx), %rdi
	movq	%rdi, %r8
	movl	%r15d, %ecx
	shrq	%cl, %r8
	orq	%rsi, %r8
	movq	%r8, -8(%rdx)
	movl	%eax, %ecx
	shlq	%cl, %rdi
	leaq	-8(%rdx), %rcx
	movq	%rcx, %rdx
	movq	%rdi, %rsi
	cmpq	%r14, %rcx
	ja	.LBB22_5
.LBB22_6:
	leal	-1(%r13), %eax
.LBB22_7:                               # =>This Inner Loop Header: Depth=1
	testb	%al, %al
	js	.LBB22_10
# %bb.8:                                #   in Loop: Header=BB22_7 Depth=1
	movzbl	%al, %edx
	movq	40(%rbx,%rdx,8), %rcx
	movq	(%r14,%rdx,8), %rdx
	cmpq	%rdx, %rcx
	ja	.LBB22_13
# %bb.9:                                #   in Loop: Header=BB22_7 Depth=1
	decb	%al
	cmpq	%rdx, %rcx
	jae	.LBB22_7
.LBB22_10:
	testb	%r13b, %r13b
	jle	.LBB22_13
# %bb.11:
	movzbl	%r13b, %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.LBB22_12:                              # =>This Inner Loop Header: Depth=1
	movq	40(%rbx,%rcx,8), %rsi
	addq	%rdx, %rsi
	xorl	%edi, %edi
	subq	%rsi, (%r14,%rcx,8)
	setb	%dil
	testq	%rsi, %rsi
	cmovneq	%rdi, %rdx
	incq	%rcx
	cmpq	%rcx, %rax
	jne	.LBB22_12
.LBB22_13:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end22:
	.size	bits2int, .Lfunc_end22-bits2int
	.cfi_endproc
                                        # -- End function
	.type	uECC_sign_with_k_internal,@function # -- Begin function uECC_sign_with_k_internal
uECC_sign_with_k_internal:              # @uECC_sign_with_k_internal
	.cfi_startproc
# %bb.0:                                # Block address taken
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushq	%rbp
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	jmp	.LBB23_25
.LBB23_25:                              # Block address taken
                                        # Label of block must be emitted
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$216, %rsp
	.cfi_def_cfa_offset 272
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	jmp	.LBB23_26
.LBB23_26:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_offset %r13, -40
	jmp	.LBB23_89
.LBB23_87:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rcx
	movl	%ebx, %r8d
	retq
.LBB23_89:                              # Block address taken
                                        # Label of block must be emitted
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_42
.LBB23_43:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	.cfi_offset %rbp, -16
	leaq	32(%rsp), %rax
	movq	%rax, 64(%rsp)
	leaq	112(%rsp), %rax
	movq	%rax, 72(%rsp)
	jmp	.LBB23_27
.LBB23_27:                              # Block address taken
                                        # Label of block must be emitted
	movzbl	(%r9), %ebp
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_45
.LBB23_46:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	leal	126(%rbx), %r12d
	testl	%eax, %eax
	cmovnsl	%eax, %r12d
	testb	%bpl, %bpl
	jle	.LBB23_1
.LBB23_2:                               # Block address taken
                                        # Label of block must be emitted
	movq	%r9, %r14
	jmp	.LBB23_53
.LBB23_51:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leaq	40(%r14), %rdi
	movsbl	%r12b, %edx
	retq
.LBB23_53:                              # Block address taken
                                        # Label of block must be emitted
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_48
.LBB23_49:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	jmp	.LBB23_59
.LBB23_57:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movsbl	%bpl, %edx
	movq	%r13, %rdi
	retq
.LBB23_59:                              # Block address taken
                                        # Label of block must be emitted
	xorl	%eax, %eax
	xorl	%ecx, %ecx
.LBB23_3:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	orq	(%r15,%rax,8), %rcx
	incq	%rax
	cmpq	%rax, %rbp
	jne	.LBB23_3
.LBB23_4:                               # Block address taken
                                        # Label of block must be emitted
	xorl	%r10d, %r10d
	testq	%rcx, %rcx
	je	.LBB23_24
.LBB23_5:                               # Block address taken
                                        # Label of block must be emitted
	movq	%rdi, 96(%rsp)                  # 8-byte Spill
	movq	%rsi, 104(%rsp)                 # 8-byte Spill
	jmp	.LBB23_65
.LBB23_63:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r13, %rsi
	movl	%ebx, %edx
	retq
.LBB23_65:                              # Block address taken
                                        # Label of block must be emitted
	movl	%edx, 16(%rsp)                  # 4-byte Spill
	movq	%r8, 24(%rsp)                   # 8-byte Spill
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_51
.LBB23_52:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	movq	%rdi, 8(%rsp)                   # 8-byte Spill
	movq	%r15, %rsi
	jmp	.LBB23_28
.LBB23_28:                              # Block address taken
                                        # Label of block must be emitted
	movl	%edx, 20(%rsp)                  # 4-byte Spill
	callq	uECC_vli_cmp
	xorl	%r10d, %r10d
	cmpb	$1, %al
	jne	.LBB23_24
.LBB23_6:                               # Block address taken
                                        # Label of block must be emitted
	leaq	32(%rsp), %rsi
	leaq	112(%rsp), %rdx
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_54
.LBB23_55:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	callq	regularize_k
	movq	%rax, %rdx
	cmpq	$0, g_rng_function(%rip)
	je	.LBB23_7
.LBB23_8:                               # Block address taken
                                        # Label of block must be emitted
	movq	64(%rsp,%rdx,8), %r13
	leaq	8(%r14), %rsi
	movq	%rdx, 88(%rsp)                  # 8-byte Spill
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_57
.LBB23_58:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	callq	uECC_generate_random_int
	movq	88(%rsp), %rdx                  # 8-byte Reload
	movq	%r13, %rcx
	jmp	.LBB23_29
.LBB23_29:                              # Block address taken
                                        # Label of block must be emitted
	xorl	%r10d, %r10d
	testl	%eax, %eax
	jne	.LBB23_9
	jmp	.LBB23_24
.LBB23_7:                               # Block address taken
                                        # Label of block must be emitted
	xorl	%ecx, %ecx
.LBB23_9:                               # Block address taken
                                        # Label of block must be emitted
	leaq	72(%r14), %rsi
	xorl	%eax, %eax
	testq	%rdx, %rdx
	jmp	.LBB23_83
.LBB23_81:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rsi
	movq	%r13, %rdx
	retq
.LBB23_83:                              # Block address taken
                                        # Label of block must be emitted
	sete	%al
	movq	64(%rsp,%rax,8), %rdx
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_60
.LBB23_61:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	jmp	.LBB23_71
.LBB23_69:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r15, %rdi
	movq	%r15, %rsi
	retq
.LBB23_71:                              # Block address taken
                                        # Label of block must be emitted
	leaq	144(%rsp), %rdi
	jmp	.LBB23_30
.LBB23_30:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r14, %r9
	callq	EccPoint_mult
	xorl	%eax, %eax
	xorl	%ecx, %ecx
.LBB23_10:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	orq	144(%rsp,%rax,8), %rcx
	incq	%rax
	cmpq	%rax, %rbp
	jne	.LBB23_10
.LBB23_11:                              # Block address taken
                                        # Label of block must be emitted
	xorl	%r10d, %r10d
	testq	%rcx, %rcx
	movl	20(%rsp), %ebx                  # 4-byte Reload
	movq	8(%rsp), %r13                   # 8-byte Reload
	je	.LBB23_24
.LBB23_12:                              # Block address taken
                                        # Label of block must be emitted
	cmpq	$0, g_rng_function(%rip)
	jmp	.LBB23_80
.LBB23_78:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movsbl	%r12b, %eax
	cltq
	retq
.LBB23_80:                              # Block address taken
                                        # Label of block must be emitted
	je	.LBB23_13
.LBB23_16:                              # Block address taken
                                        # Label of block must be emitted
	leaq	32(%rsp), %rdi
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_63
.LBB23_64:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	callq	uECC_generate_random_int
	testl	%eax, %eax
	jne	.LBB23_17
.LBB23_1:                               # Block address taken
                                        # Label of block must be emitted
	xorl	%r10d, %r10d
.LBB23_24:                              # Block address taken
                                        # Label of block must be emitted
	movl	%r10d, %eax
	addq	$216, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	jmp	.LBB23_62
.LBB23_60:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	incl	%ebx
	movswl	%bx, %r8d
	retq
.LBB23_62:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	jmp	.LBB23_31
.LBB23_31:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	popq	%rbp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	retq
.LBB23_13:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 272
	testb	%r12b, %r12b
	jle	.LBB23_15
.LBB23_14:                              # Block address taken
                                        # Label of block must be emitted
	movzbl	%r12b, %edx
	shll	$3, %edx
	jmp	.LBB23_86
.LBB23_84:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rsi
	movq	%r13, %rdx
	retq
.LBB23_86:                              # Block address taken
                                        # Label of block must be emitted
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	callq	memset@PLT
.LBB23_15:                              # Block address taken
                                        # Label of block must be emitted
	movq	$1, 32(%rsp)
	movq	8(%rsp), %r13                   # 8-byte Reload
.LBB23_17:                              # Block address taken
                                        # Label of block must be emitted
	leaq	32(%rsp), %rdx
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_66
.LBB23_67:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	movq	%r13, %rcx
	movl	%ebx, %r8d
	callq	uECC_vli_modMult
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_69
.LBB23_70:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	jmp	.LBB23_32
.LBB23_32:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r13, %rdx
	movl	%ebx, %ecx
	jmp	.LBB23_95
.LBB23_93:                              # Block address taken
                                        #   in Loop: Header=BB23_23 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movl	%edx, %ecx
	andb	$56, %cl
	retq
.LBB23_95:                              # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_modInv
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_72
.LBB23_73:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	jmp	.LBB23_92
.LBB23_90:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%rcx, %r9
	movl	%eax, %esi
	retq
.LBB23_92:                              # Block address taken
                                        # Label of block must be emitted
	leaq	32(%rsp), %rdx
	jmp	.LBB23_77
.LBB23_75:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leal	7(%rdx), %eax
	addl	$14, %edx
	retq
.LBB23_77:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r13, %rcx
	movl	%ebx, %r8d
	jmp	.LBB23_33
.LBB23_33:                              # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_modMult
	movsbl	1(%r14), %eax
	testl	%eax, %eax
	movq	24(%rsp), %r9                   # 8-byte Reload
	jle	.LBB23_20
.LBB23_18:                              # Block address taken
                                        # Label of block must be emitted
	movl	%eax, %edx
	jmp	.LBB23_56
.LBB23_54:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r15, %rdi
	movq	%r14, %rcx
	retq
.LBB23_56:                              # Block address taken
                                        # Label of block must be emitted
	negq	%rdx
	jmp	.LBB23_44
.LBB23_42:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	retq
.LBB23_44:                              # Block address taken
                                        # Label of block must be emitted
	leal	-8(,%rax,8), %esi
	decl	%eax
	xorl	%edi, %edi
.LBB23_19:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movl	%eax, %ecx
	andl	$-8, %ecx
	movq	144(%rsp,%rcx), %r8
	movl	%esi, %ecx
	jmp	.LBB23_74
.LBB23_72:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r15, %rdi
	movq	%r15, %rsi
	retq
.LBB23_74:                              # Block address taken
                                        #   in Loop: Header=BB23_19 Depth=1
                                        # Label of block must be emitted
	andb	$56, %cl
	shrq	%cl, %r8
	movb	%r8b, (%r9,%rdi)
	incq	%rdi
	jmp	.LBB23_34
.LBB23_34:                              # Block address taken
                                        #   in Loop: Header=BB23_19 Depth=1
                                        # Label of block must be emitted
	addl	$-8, %esi
	decl	%eax
	jmp	.LBB23_68
.LBB23_66:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r15, %rdi
	movq	%r15, %rsi
	retq
.LBB23_68:                              # Block address taken
                                        #   in Loop: Header=BB23_19 Depth=1
                                        # Label of block must be emitted
	movq	%rdx, %rcx
	addq	%rdi, %rcx
	jne	.LBB23_19
.LBB23_20:                              # Block address taken
                                        # Label of block must be emitted
	movswl	2(%r14), %edx
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_75
.LBB23_76:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	testl	%eax, %eax
	cmovnsl	%eax, %edx
	sarl	$3, %edx
	leaq	32(%rsp), %rdi
	movq	96(%rsp), %rsi                  # 8-byte Reload
	jmp	.LBB23_35
.LBB23_35:                              # Block address taken
                                        # Label of block must be emitted
                                        # kill: def $edx killed $edx killed $rdx
	callq	uECC_vli_bytesToNative
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_78
.LBB23_79:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	jmp	.LBB23_47
.LBB23_45:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movswl	2(%r9), %ebx
	leal	63(%rbx), %eax
	retq
.LBB23_47:                              # Block address taken
                                        # Label of block must be emitted
	movq	$0, 104(%rsp,%rax,8)
	shlq	$3, %rbp
	leaq	112(%rsp), %r13
	leaq	144(%rsp), %rsi
	jmp	.LBB23_36
.LBB23_36:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r13, %rdi
	movq	%rbp, %rdx
	callq	memcpy@PLT
	movq	%r13, %rdi
	leaq	32(%rsp), %rbp
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_81
.LBB23_82:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	movq	8(%rsp), %r12                   # 8-byte Reload
	jmp	.LBB23_37
.LBB23_37:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r12, %rcx
	movl	%ebx, %r8d
	callq	uECC_vli_modMult
	movq	%rbp, %rdi
	movq	104(%rsp), %rsi                 # 8-byte Reload
	movl	16(%rsp), %edx                  # 4-byte Reload
	movq	%r14, %rcx
	callq	bits2int
	jmp	.LBB23_38
.LBB23_38:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r13, %rdi
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_84
.LBB23_85:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	movq	%r12, %rcx
	jmp	.LBB23_50
.LBB23_48:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rcx, %r15
	sarl	$6, %r12d
	retq
.LBB23_50:                              # Block address taken
                                        # Label of block must be emitted
	movl	%ebx, %r8d
	callq	uECC_vli_modAdd
	movq	%r13, %rdi
	movq	%r13, %rsi
	jmp	.LBB23_39
.LBB23_39:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r15, %rdx
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_87
.LBB23_88:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	callq	uECC_vli_modMult
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	uECC_vli_numBits
	movswl	%ax, %ecx
	jmp	.LBB23_40
.LBB23_40:                              # Block address taken
                                        # Label of block must be emitted
	movsbl	1(%r14), %eax
	leal	(,%rax,8), %edx
	cmpl	%ecx, %edx
	movl	$0, %r10d
	jl	.LBB23_24
.LBB23_21:                              # Block address taken
                                        # Label of block must be emitted
	movl	$1, %r10d
	testb	%al, %al
	jle	.LBB23_24
.LBB23_22:                              # Block address taken
                                        # Label of block must be emitted
	movslq	%eax, %rcx
	movq	24(%rsp), %r9                   # 8-byte Reload
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_90
.LBB23_91:                              # Block address taken
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	negq	%rsi
	addl	$-8, %edx
	decl	%eax
	xorl	%edi, %edi
.LBB23_23:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movl	%eax, %ecx
	andl	$-8, %ecx
	movq	112(%rsp,%rcx), %r8
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_93
.LBB23_94:                              # Block address taken
                                        #   in Loop: Header=BB23_23 Depth=1
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	shrq	%cl, %r8
	movb	%r8b, (%r9,%rdi)
	incq	%rdi
	jmp	.LBB23_41
.LBB23_41:                              # Block address taken
                                        #   in Loop: Header=BB23_23 Depth=1
                                        # Label of block must be emitted
	addl	$-8, %edx
	jmp	.LBB23_98
.LBB23_96:                              # Block address taken
                                        #   in Loop: Header=BB23_23 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	decl	%eax
	movq	%rsi, %rcx
	retq
.LBB23_98:                              # Block address taken
                                        #   in Loop: Header=BB23_23 Depth=1
                                        # Label of block must be emitted
	subq	$272, %rsp                      # imm = 0x110
	callq	.LBB23_96
.LBB23_97:                              # Block address taken
                                        #   in Loop: Header=BB23_23 Depth=1
                                        # Label of block must be emitted
	addq	$272, %rsp                      # imm = 0x110
	addq	%rdi, %rcx
	jne	.LBB23_23
	jmp	.LBB23_24
.Lfunc_end23:
	.size	uECC_sign_with_k_internal, .Lfunc_end23-uECC_sign_with_k_internal
	.cfi_endproc
                                        # -- End function
	.globl	uECC_sign                       # -- Begin function uECC_sign
	.type	uECC_sign,@function
uECC_sign:                              # @uECC_sign
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r8, %rbx
	movq	%rcx, 24(%rsp)                  # 8-byte Spill
	movl	%edx, 12(%rsp)                  # 4-byte Spill
	movq	%rsi, 16(%rsp)                  # 8-byte Spill
	movq	%rdi, %r12
	leaq	40(%r8), %r13
	movl	$64, %r15d
	leaq	32(%rsp), %r14
	xorl	%ebp, %ebp
.LBB24_2:                               # =>This Inner Loop Header: Depth=1
	movswl	2(%rbx), %eax
	leal	63(%rax), %ecx
	addl	$126, %eax
	testl	%ecx, %ecx
	cmovnsl	%ecx, %eax
	shrl	$6, %eax
	movsbl	%al, %edx
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	uECC_generate_random_int
	testl	%eax, %eax
	je	.LBB24_5
# %bb.3:                                #   in Loop: Header=BB24_2 Depth=1
	movq	%r12, %rdi
	movq	16(%rsp), %rsi                  # 8-byte Reload
	movl	12(%rsp), %edx                  # 4-byte Reload
	movq	%r14, %rcx
	movq	24(%rsp), %r8                   # 8-byte Reload
	movq	%rbx, %r9
	callq	uECC_sign_with_k_internal
	testl	%eax, %eax
	jne	.LBB24_4
# %bb.1:                                #   in Loop: Header=BB24_2 Depth=1
	decq	%r15
	jne	.LBB24_2
	jmp	.LBB24_5
.LBB24_4:
	movl	$1, %ebp
.LBB24_5:
	movl	%ebp, %eax
	addq	$72, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end24:
	.size	uECC_sign, .Lfunc_end24-uECC_sign
	.cfi_endproc
                                        # -- End function
	.globl	uECC_sign_deterministic         # -- Begin function uECC_sign_deterministic
	.type	uECC_sign_deterministic,@function
uECC_sign_deterministic:                # @uECC_sign_deterministic
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r8, 48(%rsp)                   # 8-byte Spill
	movq	%rcx, %r15
	movl	%edx, 4(%rsp)                   # 4-byte Spill
	movq	%rsi, 32(%rsp)                  # 8-byte Spill
	movq	%rdi, 24(%rsp)                  # 8-byte Spill
	movq	32(%rcx), %r14
	movl	28(%rcx), %eax
	movswl	2(%r9), %edx
	leal	63(%rdx), %ecx
	movq	%rdx, 16(%rsp)                  # 8-byte Spill
	addl	$126, %edx
	testl	%ecx, %ecx
	cmovnsl	%ecx, %edx
	leaq	(%r14,%rax), %rbx
	sarl	$6, %edx
	movl	%edx, (%rsp)                    # 4-byte Spill
	movq	%r9, 56(%rsp)                   # 8-byte Spill
	movsbl	1(%r9), %ebp
	testq	%rax, %rax
	je	.LBB25_3
# %bb.1:
	xorl	%eax, %eax
.LBB25_2:                               # =>This Inner Loop Header: Depth=1
	movb	$1, (%rbx,%rax)
	movb	$0, (%r14,%rax)
	incq	%rax
	movl	28(%r15), %ecx
	cmpq	%rcx, %rax
	jb	.LBB25_2
.LBB25_3:
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	HMAC_init
	movl	28(%r15), %eax
	movb	$0, (%rbx,%rax)
	movl	28(%r15), %edx
	incl	%edx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	*8(%r15)
	movq	%r15, %rdi
	movq	24(%rsp), %r13                  # 8-byte Reload
	movq	%r13, %rsi
	movl	%ebp, %edx
	callq	*8(%r15)
	movq	%r15, %rdi
	movq	32(%rsp), %r12                  # 8-byte Reload
	movq	%r12, %rsi
	movl	%ebp, 8(%rsp)                   # 4-byte Spill
	movl	4(%rsp), %ebp                   # 4-byte Reload
	movl	%ebp, %edx
	callq	*8(%r15)
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%r14, %rdx
	callq	HMAC_finish
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	HMAC_init
	movl	28(%r15), %edx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	*8(%r15)
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	HMAC_finish
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	HMAC_init
	movl	28(%r15), %eax
	movb	$1, (%rbx,%rax)
	movl	28(%r15), %edx
	incl	%edx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	*8(%r15)
	movq	%r15, %rdi
	movq	%r13, %rsi
	movl	8(%rsp), %edx                   # 4-byte Reload
	callq	*8(%r15)
	movq	%r15, %rdi
	movq	%r12, %rsi
	movl	%ebp, %edx
	callq	*8(%r15)
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%r14, %rdx
	callq	HMAC_finish
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	HMAC_init
	movl	28(%r15), %edx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	*8(%r15)
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	HMAC_finish
	movl	(%rsp), %eax                    # 4-byte Reload
	movl	%eax, %ecx
	shll	$24, %ecx
	movl	%ecx, %r12d
	sarl	$21, %r12d
	movsbl	%al, %eax
	sarl	$18, %ecx
	movl	%ecx, (%rsp)                    # 4-byte Spill
	subl	16(%rsp), %ecx                  # 4-byte Folded Reload
	movq	$-1, %rdx
                                        # kill: def $cl killed $cl killed $ecx
	shrq	%cl, %rdx
	movq	%rdx, 8(%rsp)                   # 8-byte Spill
	decl	%eax
	cltq
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	xorl	%ebp, %ebp
.LBB25_4:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB25_5 Depth 2
                                        #       Child Loop BB25_8 Depth 3
	xorl	%r13d, %r13d
.LBB25_5:                               #   Parent Loop BB25_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB25_8 Depth 3
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	HMAC_init
	movl	28(%r15), %edx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	*8(%r15)
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	HMAC_finish
	movl	28(%r15), %eax
	testq	%rax, %rax
	je	.LBB25_5
# %bb.6:                                #   in Loop: Header=BB25_5 Depth=2
	negq	%rax
	movl	$1, %ecx
.LBB25_8:                               #   Parent Loop BB25_4 Depth=1
                                        #     Parent Loop BB25_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movb	-1(%rbx,%rcx), %dl
	movsbq	%r13b, %rsi
	incb	%r13b
	movb	%dl, 64(%rsp,%rsi)
	movsbl	%r13b, %edx
	cmpl	%edx, %r12d
	jle	.LBB25_9
# %bb.7:                                #   in Loop: Header=BB25_8 Depth=3
	leaq	(%rax,%rcx), %rdx
	incq	%rdx
	incq	%rcx
	cmpq	$1, %rdx
	jne	.LBB25_8
	jmp	.LBB25_5
.LBB25_9:                               #   in Loop: Header=BB25_4 Depth=1
	movl	(%rsp), %eax                    # 4-byte Reload
	cmpl	16(%rsp), %eax                  # 4-byte Folded Reload
	jle	.LBB25_11
# %bb.10:                               #   in Loop: Header=BB25_4 Depth=1
	movq	8(%rsp), %rax                   # 8-byte Reload
	movq	40(%rsp), %rcx                  # 8-byte Reload
	andq	%rax, 64(%rsp,%rcx,8)
.LBB25_11:                              #   in Loop: Header=BB25_4 Depth=1
	movq	24(%rsp), %rdi                  # 8-byte Reload
	movq	32(%rsp), %rsi                  # 8-byte Reload
	movl	4(%rsp), %edx                   # 4-byte Reload
	leaq	64(%rsp), %rcx
	movq	48(%rsp), %r8                   # 8-byte Reload
	movq	56(%rsp), %r9                   # 8-byte Reload
	callq	uECC_sign_with_k_internal
	testl	%eax, %eax
	jne	.LBB25_14
# %bb.12:                               #   in Loop: Header=BB25_4 Depth=1
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	HMAC_init
	movl	28(%r15), %eax
	movb	$0, (%rbx,%rax)
	movl	28(%r15), %edx
	incl	%edx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	*8(%r15)
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%r14, %rdx
	callq	HMAC_finish
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	HMAC_init
	movl	28(%r15), %edx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	*8(%r15)
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	HMAC_finish
	incq	%rbp
	cmpq	$64, %rbp
	jne	.LBB25_4
# %bb.13:
	xorl	%eax, %eax
	jmp	.LBB25_15
.LBB25_14:
	movl	$1, %eax
.LBB25_15:
	addq	$104, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end25:
	.size	uECC_sign_deterministic, .Lfunc_end25-uECC_sign_deterministic
	.cfi_endproc
                                        # -- End function
	.type	HMAC_init,@function             # -- Begin function HMAC_init
HMAC_init:                              # @HMAC_init
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rbx
	movl	28(%rdi), %eax
	leal	(%rax,%rax), %r14d
	addq	32(%rdi), %r14
	testl	%eax, %eax
	je	.LBB26_1
# %bb.6:
	xorl	%eax, %eax
.LBB26_7:                               # =>This Inner Loop Header: Depth=1
	movb	(%rsi,%rax), %cl
	xorb	$54, %cl
	movb	%cl, (%r14,%rax)
	incq	%rax
	movl	28(%rbx), %ecx
	cmpq	%rcx, %rax
	jb	.LBB26_7
	jmp	.LBB26_2
.LBB26_1:
	xorl	%eax, %eax
.LBB26_2:
	cmpl	24(%rbx), %eax
	jae	.LBB26_5
# %bb.3:
	movl	%eax, %eax
.LBB26_4:                               # =>This Inner Loop Header: Depth=1
	movb	$54, (%r14,%rax)
	incq	%rax
	movl	24(%rbx), %ecx
	cmpq	%rcx, %rax
	jb	.LBB26_4
.LBB26_5:
	movq	%rbx, %rdi
	callq	*(%rbx)
	movq	8(%rbx), %rax
	movl	24(%rbx), %edx
	movq	%rbx, %rdi
	movq	%r14, %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmpq	*%rax                           # TAILCALL
.Lfunc_end26:
	.size	HMAC_init, .Lfunc_end26-HMAC_init
	.cfi_endproc
                                        # -- End function
	.type	HMAC_finish,@function           # -- Begin function HMAC_finish
HMAC_finish:                            # @HMAC_finish
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %rbx
	movq	%rdi, %r14
	movl	28(%rdi), %eax
	leal	(%rax,%rax), %r15d
	addq	32(%rdi), %r15
	testl	%eax, %eax
	je	.LBB27_1
# %bb.6:
	xorl	%eax, %eax
.LBB27_7:                               # =>This Inner Loop Header: Depth=1
	movb	(%rsi,%rax), %cl
	xorb	$92, %cl
	movb	%cl, (%r15,%rax)
	incq	%rax
	movl	28(%r14), %ecx
	cmpq	%rcx, %rax
	jb	.LBB27_7
	jmp	.LBB27_2
.LBB27_1:
	xorl	%eax, %eax
.LBB27_2:
	cmpl	24(%r14), %eax
	jae	.LBB27_5
# %bb.3:
	movl	%eax, %eax
.LBB27_4:                               # =>This Inner Loop Header: Depth=1
	movb	$92, (%r15,%rax)
	incq	%rax
	movl	24(%r14), %ecx
	cmpq	%rcx, %rax
	jb	.LBB27_4
.LBB27_5:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	*16(%r14)
	movq	%r14, %rdi
	callq	*(%r14)
	movl	24(%r14), %edx
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	*8(%r14)
	movl	28(%r14), %edx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	*8(%r14)
	movq	16(%r14), %rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmpq	*%rax                           # TAILCALL
.Lfunc_end27:
	.size	HMAC_finish, .Lfunc_end27-HMAC_finish
	.cfi_endproc
                                        # -- End function
	.globl	uECC_verify                     # -- Begin function uECC_verify
	.type	uECC_verify,@function
uECC_verify:                            # @uECC_verify
	.cfi_startproc
# %bb.0:                                # Block address taken
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushq	%rbp
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	jmp	.LBB28_42
.LBB28_42:                              # Block address taken
                                        # Label of block must be emitted
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$632, %rsp                      # imm = 0x278
	.cfi_def_cfa_offset 688
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	jmp	.LBB28_43
.LBB28_43:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_offset %r13, -40
	jmp	.LBB28_87
.LBB28_85:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r15, %rsi
	movl	%ebx, %edx
	retq
.LBB28_87:                              # Block address taken
                                        # Label of block must be emitted
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_70
.LBB28_71:                              # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	.cfi_offset %rbp, -16
	movq	%rcx, %r15
	jmp	.LBB28_123
.LBB28_121:                             # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r13, %rcx
	movq	%r12, %r8
	retq
.LBB28_123:                             # Block address taken
                                        # Label of block must be emitted
	movl	%edx, 40(%rsp)                  # 4-byte Spill
	movq	%rsi, 32(%rsp)                  # 8-byte Spill
	movq	%rdi, %rbp
	jmp	.LBB28_44
.LBB28_44:                              # Block address taken
                                        # Label of block must be emitted
	movsbq	(%r8), %r12
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_73
.LBB28_74:                              # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	addl	$126, %ecx
	testl	%eax, %eax
	cmovnsl	%eax, %ecx
	sarl	$6, %ecx
	movq	%rcx, 16(%rsp)                  # 8-byte Spill
	jmp	.LBB28_45
.LBB28_45:                              # Block address taken
                                        # Label of block must be emitted
	movsbl	%cl, %eax
	movl	%eax, 12(%rsp)                  # 4-byte Spill
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_76
.LBB28_77:                              # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	movq	%r13, 72(%rsp,%r14,8)
	movq	%r13, 136(%rsp,%r14,8)
	movq	%r13, 232(%rsp,%r14,8)
	movq	%r8, 136(%rsp)                  # 8-byte Spill
	jmp	.LBB28_46
.LBB28_46:                              # Block address taken
                                        # Label of block must be emitted
	movsbq	1(%r8), %rbx
	leaq	400(%rsp), %rdi
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_79
.LBB28_80:                              # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	callq	uECC_vli_bytesToNative
	leaq	(%rsp,%r12,8), %rdi
	addq	$400, %rdi                      # imm = 0x190
	addq	%rbx, %rbp
	jmp	.LBB28_47
.LBB28_47:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rdi, 24(%rsp)                  # 8-byte Spill
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_82
.LBB28_83:                              # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	callq	uECC_vli_bytesToNative
	leaq	144(%rsp), %rdi
	movq	%r15, %rsi
	movl	%ebx, %edx
	callq	uECC_vli_bytesToNative
	jmp	.LBB28_48
.LBB28_48:                              # Block address taken
                                        # Label of block must be emitted
	addq	%rbx, %r15
	leaq	240(%rsp), %rdi
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_85
.LBB28_86:                              # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	callq	uECC_vli_bytesToNative
	testq	%r12, %r12
	jle	.LBB28_41
.LBB28_1:                               # Block address taken
                                        # Label of block must be emitted
	decq	%r14
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_88
.LBB28_89:                              # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	xorl	%eax, %eax
	xorl	%ecx, %ecx
.LBB28_2:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	orq	144(%rsp,%rax,8), %rcx
	incq	%rax
	cmpq	%rax, %rbx
	jne	.LBB28_2
.LBB28_3:                               # Block address taken
                                        # Label of block must be emitted
	testq	%rcx, %rcx
	movq	136(%rsp), %r12                 # 8-byte Reload
	je	.LBB28_4
.LBB28_5:                               # Block address taken
                                        # Label of block must be emitted
	xorl	%eax, %eax
	xorl	%ecx, %ecx
.LBB28_6:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	orq	240(%rsp,%rax,8), %rcx
	incq	%rax
	cmpq	%rax, %rbx
	jne	.LBB28_6
.LBB28_7:                               # Block address taken
                                        # Label of block must be emitted
	xorl	%r13d, %r13d
	testq	%rcx, %rcx
	je	.LBB28_41
.LBB28_8:                               # Block address taken
                                        # Label of block must be emitted
	leaq	40(%r12), %r15
	movq	16(%rsp), %rax                  # 8-byte Reload
	decl	%eax
.LBB28_9:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	testb	%al, %al
	js	.LBB28_41
.LBB28_10:                              # Block address taken
                                        #   in Loop: Header=BB28_9 Depth=1
                                        # Label of block must be emitted
	movzbl	%al, %esi
	movq	(%r15,%rsi,8), %rcx
	jmp	.LBB28_93
.LBB28_91:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdi
	movq	%r14, %rsi
	retq
.LBB28_93:                              # Block address taken
                                        #   in Loop: Header=BB28_9 Depth=1
                                        # Label of block must be emitted
	movq	144(%rsp,%rsi,8), %rsi
	cmpq	%rsi, %rcx
	ja	.LBB28_11
.LBB28_15:                              # Block address taken
                                        #   in Loop: Header=BB28_9 Depth=1
                                        # Label of block must be emitted
	decb	%al
	cmpq	%rsi, %rcx
	jae	.LBB28_9
	jmp	.LBB28_41
.LBB28_4:                               # Block address taken
                                        # Label of block must be emitted
	xorl	%r13d, %r13d
.LBB28_41:                              # Block address taken
                                        # Label of block must be emitted
	movl	%r13d, %eax
	addq	$632, %rsp                      # imm = 0x278
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	jmp	.LBB28_49
.LBB28_49:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	jmp	.LBB28_114
.LBB28_112:                             # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r13, %rdi
	xorl	%esi, %esi
	retq
.LBB28_114:                             # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	popq	%rbp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	retq
.LBB28_11:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 688
	movq	16(%rsp), %rax                  # 8-byte Reload
	decl	%eax
.LBB28_12:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	testb	%al, %al
	js	.LBB28_41
.LBB28_13:                              # Block address taken
                                        #   in Loop: Header=BB28_12 Depth=1
                                        # Label of block must be emitted
	movzbl	%al, %esi
	movq	(%r15,%rsi,8), %rcx
	movq	240(%rsp,%rsi,8), %rsi
	cmpq	%rsi, %rcx
	ja	.LBB28_16
.LBB28_14:                              # Block address taken
                                        #   in Loop: Header=BB28_12 Depth=1
                                        # Label of block must be emitted
	decb	%al
	cmpq	%rsi, %rcx
	jae	.LBB28_12
	jmp	.LBB28_41
.LBB28_16:                              # Block address taken
                                        # Label of block must be emitted
	leaq	48(%rsp), %rdi
	leaq	240(%rsp), %rsi
	movq	%r15, %rdx
	movl	12(%rsp), %ecx                  # 4-byte Reload
	callq	uECC_vli_modInv
	xorl	%r13d, %r13d
	movq	%r13, 304(%rsp,%r14,8)
	leaq	304(%rsp), %r14
	jmp	.LBB28_50
.LBB28_50:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r14, %rdi
	movq	32(%rsp), %rsi                  # 8-byte Reload
	movl	40(%rsp), %edx                  # 4-byte Reload
	movq	%r12, %rcx
	callq	bits2int
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_91
.LBB28_92:                              # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	leaq	48(%rsp), %rdx
	jmp	.LBB28_51
.LBB28_51:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r15, %rcx
	movl	12(%rsp), %r14d                 # 4-byte Reload
	movl	%r14d, %r8d
	callq	uECC_vli_modMult
	leaq	368(%rsp), %rdi
	leaq	144(%rsp), %rsi
	leaq	48(%rsp), %rdx
	movq	%r15, 128(%rsp)                 # 8-byte Spill
	jmp	.LBB28_52
.LBB28_52:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r15, %rcx
	movl	%r14d, %r8d
	callq	uECC_vli_modMult
	leaq	(,%rbx,8), %r14
	leaq	496(%rsp), %r15
	movq	%r15, %rdi
	leaq	400(%rsp), %rsi
	movq	%r14, %rdx
	jmp	.LBB28_53
.LBB28_53:                              # Block address taken
                                        # Label of block must be emitted
	callq	memcpy@PLT
	leaq	(%rsp,%rbp,8), %rdi
	addq	$496, %rdi                      # imm = 0x1F0
	movq	%rdi, 112(%rsp)                 # 8-byte Spill
	movq	24(%rsp), %rsi                  # 8-byte Reload
	movq	%r14, %rdx
	callq	memcpy@PLT
	leaq	72(%r12), %rsi
	jmp	.LBB28_54
.LBB28_54:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rsi, 120(%rsp)                 # 8-byte Spill
	leaq	208(%rsp), %rdi
	movq	%r14, %rdx
	callq	memcpy@PLT
	movq	%rbp, 32(%rsp)                  # 8-byte Spill
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_94
.LBB28_95:                              # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	leaq	272(%rsp), %rdi
	jmp	.LBB28_55
.LBB28_55:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r14, 40(%rsp)                  # 8-byte Spill
	movq	%r14, %rdx
	callq	memcpy@PLT
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_97
.LBB28_98:                              # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	leaq	48(%rsp), %rdi
	movq	%r15, %rsi
	leaq	208(%rsp), %rdx
	jmp	.LBB28_56
.LBB28_56:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbp, %rcx
	movl	%r8d, %r14d
	callq	uECC_vli_modSub
	leaq	208(%rsp), %rdi
	leaq	272(%rsp), %rsi
	movq	%r15, %rdx
	movq	112(%rsp), %r15                 # 8-byte Reload
	movq	%r15, %rcx
	jmp	.LBB28_57
.LBB28_57:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r12, %r8
	callq	XYcZ_add
	leaq	48(%rsp), %rdi
	movq	%rdi, %rsi
	movq	%rbp, 24(%rsp)                  # 8-byte Spill
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_100
.LBB28_101:                             # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	jmp	.LBB28_111
.LBB28_109:                             # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	shlq	$4, %rdx
	retq
.LBB28_111:                             # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_modInv
	jmp	.LBB28_58
.LBB28_58:                              # Block address taken
                                        # Label of block must be emitted
	leaq	496(%rsp), %rbp
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_103
.LBB28_104:                             # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	leaq	48(%rsp), %rdx
	movq	%r12, %rcx
	callq	apply_z
	movq	%r13, 176(%rsp)
	movq	120(%rsp), %rax                 # 8-byte Reload
	jmp	.LBB28_59
.LBB28_59:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rax, 184(%rsp)
	leaq	400(%rsp), %rax
	movq	%rax, 192(%rsp)
	movq	%rbp, 200(%rsp)
	jmp	.LBB28_105
.LBB28_103:                             # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rdi
	movq	%r15, %rsi
	retq
.LBB28_105:                             # Block address taken
                                        # Label of block must be emitted
	leaq	304(%rsp), %rdi
	movl	12(%rsp), %ebp                  # 4-byte Reload
	movl	%ebp, %esi
	callq	uECC_vli_numBits
	jmp	.LBB28_60
.LBB28_60:                              # Block address taken
                                        # Label of block must be emitted
	movl	%eax, %r14d
	leaq	368(%rsp), %rdi
	movl	%ebp, %esi
	callq	uECC_vli_numBits
	movl	%eax, %ebp
	cmpw	%ax, %r14w
	cmovgl	%r14d, %ebp
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_106
.LBB28_107:                             # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	jmp	.LBB28_61
.LBB28_61:                              # Block address taken
                                        # Label of block must be emitted
	decl	%eax
	jmp	.LBB28_126
.LBB28_124:                             # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	retq
.LBB28_126:                             # Block address taken
                                        # Label of block must be emitted
	jmp	.LBB28_120
.LBB28_118:                             # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	shlq	$4, %rcx
	leaq	(%rcx,%rsi,8), %rax
	retq
.LBB28_120:                             # Block address taken
                                        # Label of block must be emitted
	movswl	%ax, %ecx
	jmp	.LBB28_102
.LBB28_100:                             # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rdx
	movl	%r14d, %ecx
	retq
.LBB28_102:                             # Block address taken
                                        # Label of block must be emitted
	sarl	$6, %ecx
	movslq	%ecx, %rcx
	jmp	.LBB28_72
.LBB28_70:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	retq
.LBB28_72:                              # Block address taken
                                        # Label of block must be emitted
	movq	304(%rsp,%rcx,8), %rdx
	xorl	%esi, %esi
	btq	%rax, %rdx
	setb	%sil
	jmp	.LBB28_62
.LBB28_62:                              # Block address taken
                                        # Label of block must be emitted
	movq	368(%rsp,%rcx,8), %rcx
	xorl	%edx, %edx
	btq	%rax, %rcx
	setb	%dl
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_109
.LBB28_110:                             # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	leaq	(%rdx,%rsi,8), %rax
	movq	176(%rsp,%rax), %rax
.LBB28_17:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	(%rax,%r13,8), %rcx
	jmp	.LBB28_129
.LBB28_127:                             # Block address taken
                                        #   in Loop: Header=BB28_35 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%rdx, %rsi
	xorl	%edi, %edi
	retq
.LBB28_129:                             # Block address taken
                                        #   in Loop: Header=BB28_17 Depth=1
                                        # Label of block must be emitted
	jmp	.LBB28_84
.LBB28_82:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rsi
	movl	%ebx, %edx
	retq
.LBB28_84:                              # Block address taken
                                        #   in Loop: Header=BB28_17 Depth=1
                                        # Label of block must be emitted
	movq	%rcx, 80(%rsp,%r13,8)
	jmp	.LBB28_78
.LBB28_76:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movslq	%eax, %r14
	xorl	%r13d, %r13d
	retq
.LBB28_78:                              # Block address taken
                                        #   in Loop: Header=BB28_17 Depth=1
                                        # Label of block must be emitted
	incq	%r13
	cmpq	%r13, %rbx
	jne	.LBB28_17
.LBB28_18:                              # Block address taken
                                        # Label of block must be emitted
	movq	32(%rsp), %r15                  # 8-byte Reload
	leaq	(%rax,%r15,8), %rax
	xorl	%ecx, %ecx
.LBB28_19:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	(%rax,%rcx,8), %rdx
	movq	%rdx, 336(%rsp,%rcx,8)
	incq	%rcx
	cmpq	%rcx, %rbx
	jne	.LBB28_19
.LBB28_20:                              # Block address taken
                                        # Label of block must be emitted
	leaq	48(%rsp), %r13
	jmp	.LBB28_117
.LBB28_115:                             # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movzwl	%bp, %edx
	xorl	%esi, %esi
	retq
.LBB28_117:                             # Block address taken
                                        # Label of block must be emitted
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_112
.LBB28_113:                             # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	movq	40(%rsp), %rdx                  # 8-byte Reload
	callq	memset@PLT
	movq	$1, (%r13)
	addw	$-2, %bp
	js	.LBB28_29
.LBB28_21:                              # Block address taken
                                        # Label of block must be emitted
	leaq	336(%rsp), %r13
.LBB28_22:                              # Block address taken
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB28_24 Depth 2
                                        #     Child Loop BB28_26 Depth 2
                                        # Label of block must be emitted
	leaq	80(%rsp), %rdi
	movq	%r13, %rsi
	leaq	48(%rsp), %rdx
	movq	%r12, %rcx
	jmp	.LBB28_81
.LBB28_79:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rsi
	movl	%ebx, %edx
	retq
.LBB28_81:                              # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	callq	*168(%r12)
	movl	%ebp, %eax
	shrl	$3, %eax
	andl	$8184, %eax                     # imm = 0x1FF8
	jmp	.LBB28_63
.LBB28_63:                              # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	movq	304(%rsp,%rax), %rcx
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_115
.LBB28_116:                             # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	btq	%rdx, %rcx
	setb	%sil
	movq	368(%rsp,%rax), %rax
	xorl	%ecx, %ecx
	btq	%rdx, %rax
	jmp	.LBB28_64
.LBB28_64:                              # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	setb	%cl
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_118
.LBB28_119:                             # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	movq	176(%rsp,%rax), %rax
	testq	%rax, %rax
	je	.LBB28_28
.LBB28_23:                              # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	xorl	%ecx, %ecx
.LBB28_24:                              # Block address taken
                                        #   Parent Loop BB28_22 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	(%rax,%rcx,8), %rdx
	movq	%rdx, 208(%rsp,%rcx,8)
	jmp	.LBB28_108
.LBB28_106:                             # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movl	%ebp, %eax
	retq
.LBB28_108:                             # Block address taken
                                        #   in Loop: Header=BB28_24 Depth=2
                                        # Label of block must be emitted
	incq	%rcx
	cmpq	%rcx, %rbx
	jne	.LBB28_24
.LBB28_25:                              # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	movq	%r15, %r13
	leaq	(%rax,%r15,8), %rax
	xorl	%ecx, %ecx
.LBB28_26:                              # Block address taken
                                        #   Parent Loop BB28_22 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	(%rax,%rcx,8), %rdx
	movq	%rdx, 272(%rsp,%rcx,8)
	incq	%rcx
	cmpq	%rcx, %rbx
	jne	.LBB28_26
.LBB28_27:                              # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	leaq	208(%rsp), %rdi
	leaq	272(%rsp), %rsi
	leaq	48(%rsp), %rdx
	movq	%r12, %rcx
	callq	apply_z
	leaq	464(%rsp), %rdi
	leaq	80(%rsp), %r14
	movq	%r14, %rsi
	jmp	.LBB28_65
.LBB28_65:                              # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	leaq	208(%rsp), %r15
	movq	%r15, %rdx
	movq	24(%rsp), %rcx                  # 8-byte Reload
	movl	%r13d, %r8d
	callq	uECC_vli_modSub
	movq	%r15, %rdi
	leaq	272(%rsp), %rsi
	movq	%r14, %rdx
	jmp	.LBB28_66
.LBB28_66:                              # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	movq	%r13, %r15
	leaq	336(%rsp), %r13
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_121
.LBB28_122:                             # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	callq	XYcZ_add
	movsbl	(%r12), %ecx
	leaq	560(%rsp), %rdi
	leaq	48(%rsp), %r14
	jmp	.LBB28_67
.LBB28_67:                              # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	movq	%r14, %rsi
	leaq	464(%rsp), %rdx
	callq	uECC_vli_mult
	movq	%r14, %rdi
	leaq	560(%rsp), %rsi
	callq	*192(%r12)
.LBB28_28:                              # Block address taken
                                        #   in Loop: Header=BB28_22 Depth=1
                                        # Label of block must be emitted
	decw	%bp
	jns	.LBB28_22
.LBB28_29:                              # Block address taken
                                        # Label of block must be emitted
	movsbl	%bl, %ecx
	leaq	48(%rsp), %rbx
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_124
.LBB28_125:                             # Block address taken
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	jmp	.LBB28_96
.LBB28_94:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leaq	(%r12,%rbp,8), %rsi
	addq	$72, %rsi
	retq
.LBB28_96:                              # Block address taken
                                        # Label of block must be emitted
	movq	24(%rsp), %rdx                  # 8-byte Reload
	callq	uECC_vli_modInv
	leaq	80(%rsp), %rdi
	leaq	336(%rsp), %rsi
	jmp	.LBB28_68
.LBB28_68:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbx, %rdx
	movq	%r12, %rcx
	callq	apply_z
	movq	16(%rsp), %rax                  # 8-byte Reload
	decl	%eax
	movq	128(%rsp), %r8                  # 8-byte Reload
.LBB28_30:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	testb	%al, %al
	js	.LBB28_33
.LBB28_31:                              # Block address taken
                                        #   in Loop: Header=BB28_30 Depth=1
                                        # Label of block must be emitted
	movzbl	%al, %edx
	movq	(%r8,%rdx,8), %rcx
	jmp	.LBB28_90
.LBB28_88:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rbp
	movzbl	%r12b, %ebx
	retq
.LBB28_90:                              # Block address taken
                                        #   in Loop: Header=BB28_30 Depth=1
                                        # Label of block must be emitted
	movq	80(%rsp,%rdx,8), %rdx
	cmpq	%rdx, %rcx
	ja	.LBB28_36
.LBB28_32:                              # Block address taken
                                        #   in Loop: Header=BB28_30 Depth=1
                                        # Label of block must be emitted
	decb	%al
	jmp	.LBB28_75
.LBB28_73:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movswl	2(%r8), %ecx
	leal	63(%rcx), %eax
	retq
.LBB28_75:                              # Block address taken
                                        #   in Loop: Header=BB28_30 Depth=1
                                        # Label of block must be emitted
	cmpq	%rdx, %rcx
	jae	.LBB28_30
.LBB28_33:                              # Block address taken
                                        # Label of block must be emitted
	cmpb	$0, 16(%rsp)                    # 1-byte Folded Reload
	jle	.LBB28_36
.LBB28_34:                              # Block address taken
                                        # Label of block must be emitted
	movzbl	16(%rsp), %eax                  # 1-byte Folded Reload
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.LBB28_35:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	(%r8,%rcx,8), %rsi
	subq	$688, %rsp                      # imm = 0x2B0
	callq	.LBB28_127
.LBB28_128:                             # Block address taken
                                        #   in Loop: Header=BB28_35 Depth=1
                                        # Label of block must be emitted
	addq	$688, %rsp                      # imm = 0x2B0
	subq	%rsi, 80(%rsp,%rcx,8)
	setb	%dil
	testq	%rsi, %rsi
	cmovneq	%rdi, %rdx
	incq	%rcx
	jmp	.LBB28_69
.LBB28_69:                              # Block address taken
                                        #   in Loop: Header=BB28_35 Depth=1
                                        # Label of block must be emitted
	cmpq	%rcx, %rax
	jne	.LBB28_35
.LBB28_36:                              # Block address taken
                                        # Label of block must be emitted
	decb	%r15b
	jmp	.LBB28_99
.LBB28_97:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leaq	8(%r12), %rbp
	movsbl	%bl, %r8d
	retq
.LBB28_99:                              # Block address taken
                                        # Label of block must be emitted
	js	.LBB28_37
.LBB28_38:                              # Block address taken
                                        # Label of block must be emitted
	movzbl	%r15b, %ecx
	xorl	%eax, %eax
.LBB28_39:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	144(%rsp,%rcx,8), %rdx
	xorq	80(%rsp,%rcx,8), %rdx
	orq	%rdx, %rax
	addq	$-1, %rcx
	jb	.LBB28_39
.LBB28_40:                              # Block address taken
                                        # Label of block must be emitted
	xorl	%r13d, %r13d
	testq	%rax, %rax
	sete	%r13b
	jmp	.LBB28_41
.LBB28_37:                              # Block address taken
                                        # Label of block must be emitted
	movl	$1, %r13d
	jmp	.LBB28_41
.Lfunc_end28:
	.size	uECC_verify, .Lfunc_end28-uECC_verify
	.cfi_endproc
                                        # -- End function
	.type	uECC_vli_modInv,@function       # -- Begin function uECC_vli_modInv
uECC_vli_modInv:                        # @uECC_vli_modInv
	.cfi_startproc
# %bb.0:                                # Block address taken
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushq	%rbp
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	jmp	.LBB29_45
.LBB29_45:                              # Block address taken
                                        # Label of block must be emitted
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	jmp	.LBB29_46
.LBB29_46:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_offset %r13, -40
	jmp	.LBB29_110
.LBB29_108:                             # Block address taken
                                        #   in Loop: Header=BB29_18 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rdx, %rsi
	shrq	%rsi
	retq
.LBB29_110:                             # Block address taken
                                        # Label of block must be emitted
	subq	$224, %rsp
	callq	.LBB29_63
.LBB29_64:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	.cfi_offset %rbp, -16
	movl	%ecx, %r14d
	testb	%r14b, %r14b
	jle	.LBB29_43
.LBB29_1:                               # Block address taken
                                        # Label of block must be emitted
	movq	%rdx, %r15
	subq	$224, %rsp
	callq	.LBB29_66
.LBB29_67:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	xorl	%ecx, %ecx
.LBB29_2:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	orq	(%rsi,%rax,8), %rcx
	incq	%rax
	jmp	.LBB29_92
.LBB29_90:                              # Block address taken
                                        #   in Loop: Header=BB29_29 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%rcx, %rdx
	xorl	%esi, %esi
	retq
.LBB29_92:                              # Block address taken
                                        #   in Loop: Header=BB29_2 Depth=1
                                        # Label of block must be emitted
	cmpq	%rax, %r12
	jmp	.LBB29_101
.LBB29_99:                              # Block address taken
                                        #   in Loop: Header=BB29_37 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leaq	(%rdx,%rcx), %rsi
	addq	(%r15,%rax,8), %rsi
	retq
.LBB29_101:                             # Block address taken
                                        #   in Loop: Header=BB29_2 Depth=1
                                        # Label of block must be emitted
	jne	.LBB29_2
.LBB29_3:                               # Block address taken
                                        # Label of block must be emitted
	testq	%rcx, %rcx
	jmp	.LBB29_77
.LBB29_75:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	$128, %r13
	leal	-1(%r14), %eax
	retq
.LBB29_77:                              # Block address taken
                                        # Label of block must be emitted
	je	.LBB29_44
.LBB29_4:                               # Block address taken
                                        # Label of block must be emitted
	movq	%rdi, 88(%rsp)                  # 8-byte Spill
	leaq	(,%r12,8), %r13
	leaq	128(%rsp), %rbp
	subq	$224, %rsp
	callq	.LBB29_69
.LBB29_70:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	callq	memcpy@PLT
	leaq	96(%rsp), %rbx
	movq	%rbx, %rdi
	jmp	.LBB29_47
.LBB29_47:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r15, %rsi
	movq	%r13, %rdx
	callq	memcpy@PLT
	leaq	16(%rsp), %rdi
	subq	$224, %rsp
	callq	.LBB29_72
.LBB29_73:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	callq	memset@PLT
	leaq	16(%rsp), %rax
	jmp	.LBB29_48
.LBB29_48:                              # Block address taken
                                        # Label of block must be emitted
	movq	$1, (%rax)
	leaq	48(%rsp), %rdi
	xorl	%esi, %esi
	movq	%r13, 80(%rsp)                  # 8-byte Spill
	jmp	.LBB29_113
.LBB29_111:                             # Block address taken
                                        #   in Loop: Header=BB29_24 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leaq	(%rdx,%rcx), %rsi
	addq	(%r15,%rax,8), %rsi
	retq
.LBB29_113:                             # Block address taken
                                        # Label of block must be emitted
	movq	%r13, %rdx
	callq	memset@PLT
	leaq	(%rsp,%r12,8), %rax
	addq	$96, %rax
	jmp	.LBB29_49
.LBB29_49:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	leaq	(%rsp,%r12,8), %r13
	subq	$224, %rsp
	callq	.LBB29_75
.LBB29_76:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	movl	%eax, 4(%rsp)                   # 4-byte Spill
.LBB29_5:                               # Block address taken
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB29_6 Depth 2
                                        #     Child Loop BB29_16 Depth 2
                                        #     Child Loop BB29_18 Depth 2
                                        #     Child Loop BB29_20 Depth 2
                                        #     Child Loop BB29_24 Depth 2
                                        #     Child Loop BB29_26 Depth 2
                                        #     Child Loop BB29_29 Depth 2
                                        #     Child Loop BB29_31 Depth 2
                                        #     Child Loop BB29_33 Depth 2
                                        #     Child Loop BB29_37 Depth 2
                                        #     Child Loop BB29_39 Depth 2
                                        #     Child Loop BB29_13 Depth 2
                                        #     Child Loop BB29_10 Depth 2
                                        # Label of block must be emitted
	movl	%r14d, %eax
.LBB29_6:                               # Block address taken
                                        #   Parent Loop BB29_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	decb	%al
	jmp	.LBB29_107
.LBB29_105:                             # Block address taken
                                        #   in Loop: Header=BB29_16 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%rcx, %rdx
	xorl	%esi, %esi
	retq
.LBB29_107:                             # Block address taken
                                        #   in Loop: Header=BB29_6 Depth=2
                                        # Label of block must be emitted
	js	.LBB29_42
.LBB29_7:                               # Block address taken
                                        #   in Loop: Header=BB29_6 Depth=2
                                        # Label of block must be emitted
	movzbl	%al, %edx
	movq	128(%rsp,%rdx,8), %rcx
	movq	96(%rsp,%rdx,8), %rdx
	cmpq	%rdx, %rcx
	je	.LBB29_6
.LBB29_8:                               # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	testb	$1, 128(%rsp)
	jmp	.LBB29_86
.LBB29_84:                              # Block address taken
                                        #   in Loop: Header=BB29_13 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rdx, %rsi
	shrq	%rsi
	retq
.LBB29_86:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	jne	.LBB29_11
.LBB29_9:                               # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	movq	%r13, %rax
	jmp	.LBB29_83
.LBB29_81:                              # Block address taken
                                        #   in Loop: Header=BB29_10 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leaq	-8(%rax), %rsi
	shlq	$63, %rdx
	retq
.LBB29_83:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	xorl	%ecx, %ecx
.LBB29_10:                              # Block address taken
                                        #   Parent Loop BB29_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	-8(%rax), %rdx
	subq	$224, %rsp
	callq	.LBB29_78
.LBB29_79:                              # Block address taken
                                        #   in Loop: Header=BB29_10 Depth=2
                                        # Label of block must be emitted
	addq	$224, %rsp
	orq	%rcx, %rsi
	movq	%rsi, -8(%rax)
	subq	$224, %rsp
	callq	.LBB29_81
.LBB29_82:                              # Block address taken
                                        #   in Loop: Header=BB29_10 Depth=2
                                        # Label of block must be emitted
	addq	$224, %rsp
	movq	%rsi, %rax
	jmp	.LBB29_50
.LBB29_50:                              # Block address taken
                                        #   in Loop: Header=BB29_10 Depth=2
                                        # Label of block must be emitted
	movq	%rdx, %rcx
	cmpq	%rbp, %rsi
	ja	.LBB29_10
.LBB29_40:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	leaq	16(%rsp), %rdi
	jmp	.LBB29_41
.LBB29_11:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	testb	$1, 96(%rsp)
	jne	.LBB29_14
.LBB29_12:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	movq	8(%rsp), %rax                   # 8-byte Reload
	xorl	%ecx, %ecx
.LBB29_13:                              # Block address taken
                                        #   Parent Loop BB29_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	-8(%rax), %rdx
	subq	$224, %rsp
	callq	.LBB29_84
.LBB29_85:                              # Block address taken
                                        #   in Loop: Header=BB29_13 Depth=2
                                        # Label of block must be emitted
	addq	$224, %rsp
	orq	%rcx, %rsi
	movq	%rsi, -8(%rax)
	subq	$224, %rsp
	callq	.LBB29_87
.LBB29_88:                              # Block address taken
                                        #   in Loop: Header=BB29_13 Depth=2
                                        # Label of block must be emitted
	addq	$224, %rsp
	movq	%rsi, %rax
	jmp	.LBB29_51
.LBB29_51:                              # Block address taken
                                        #   in Loop: Header=BB29_13 Depth=2
                                        # Label of block must be emitted
	movq	%rdx, %rcx
	cmpq	%rbx, %rsi
	jmp	.LBB29_98
.LBB29_96:                              # Block address taken
                                        #   in Loop: Header=BB29_31 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leaq	-8(%rax), %rsi
	shlq	$63, %rdx
	retq
.LBB29_98:                              # Block address taken
                                        #   in Loop: Header=BB29_13 Depth=2
                                        # Label of block must be emitted
	ja	.LBB29_13
	jmp	.LBB29_27
.LBB29_14:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	xorl	%eax, %eax
	jmp	.LBB29_116
.LBB29_114:                             # Block address taken
                                        #   in Loop: Header=BB29_26 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%rcx, %rdx
	xorl	%esi, %esi
	retq
.LBB29_116:                             # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	jmp	.LBB29_95
.LBB29_93:                              # Block address taken
                                        #   in Loop: Header=BB29_31 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rdx, %rsi
	shrq	%rsi
	retq
.LBB29_95:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	cmpq	%rdx, %rcx
	jbe	.LBB29_15
.LBB29_28:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	xorl	%ecx, %ecx
.LBB29_29:                              # Block address taken
                                        #   Parent Loop BB29_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	96(%rsp,%rax,8), %rdx
	subq	$224, %rsp
	callq	.LBB29_90
.LBB29_91:                              # Block address taken
                                        #   in Loop: Header=BB29_29 Depth=2
                                        # Label of block must be emitted
	addq	$224, %rsp
	subq	%rdx, 128(%rsp,%rax,8)
	setb	%sil
	testq	%rdx, %rdx
	cmovneq	%rsi, %rcx
	incq	%rax
	jmp	.LBB29_52
.LBB29_52:                              # Block address taken
                                        #   in Loop: Header=BB29_29 Depth=2
                                        # Label of block must be emitted
	cmpq	%rax, %r12
	jne	.LBB29_29
.LBB29_30:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	movq	%r13, %rax
	xorl	%ecx, %ecx
.LBB29_31:                              # Block address taken
                                        #   Parent Loop BB29_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	-8(%rax), %rdx
	subq	$224, %rsp
	callq	.LBB29_93
.LBB29_94:                              # Block address taken
                                        #   in Loop: Header=BB29_31 Depth=2
                                        # Label of block must be emitted
	addq	$224, %rsp
	orq	%rcx, %rsi
	movq	%rsi, -8(%rax)
	subq	$224, %rsp
	callq	.LBB29_96
.LBB29_97:                              # Block address taken
                                        #   in Loop: Header=BB29_31 Depth=2
                                        # Label of block must be emitted
	addq	$224, %rsp
	movq	%rsi, %rax
	jmp	.LBB29_53
.LBB29_53:                              # Block address taken
                                        #   in Loop: Header=BB29_31 Depth=2
                                        # Label of block must be emitted
	movq	%rdx, %rcx
	cmpq	%rbp, %rsi
	ja	.LBB29_31
.LBB29_32:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	movl	4(%rsp), %eax                   # 4-byte Reload
                                        # kill: def $al killed $al killed $eax
.LBB29_33:                              # Block address taken
                                        #   Parent Loop BB29_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	testb	%al, %al
	js	.LBB29_38
.LBB29_34:                              # Block address taken
                                        #   in Loop: Header=BB29_33 Depth=2
                                        # Label of block must be emitted
	movzbl	%al, %edx
	movq	16(%rsp,%rdx,8), %rcx
	movq	48(%rsp,%rdx,8), %rdx
	cmpq	%rdx, %rcx
	ja	.LBB29_38
.LBB29_35:                              # Block address taken
                                        #   in Loop: Header=BB29_33 Depth=2
                                        # Label of block must be emitted
	decb	%al
	jmp	.LBB29_65
.LBB29_63:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	retq
.LBB29_65:                              # Block address taken
                                        #   in Loop: Header=BB29_33 Depth=2
                                        # Label of block must be emitted
	cmpq	%rdx, %rcx
	jae	.LBB29_33
.LBB29_36:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	xorl	%eax, %eax
	xorl	%ecx, %ecx
.LBB29_37:                              # Block address taken
                                        #   Parent Loop BB29_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	16(%rsp,%rax,8), %rdx
	subq	$224, %rsp
	callq	.LBB29_99
.LBB29_100:                             # Block address taken
                                        #   in Loop: Header=BB29_37 Depth=2
                                        # Label of block must be emitted
	addq	$224, %rsp
	xorl	%edi, %edi
	jmp	.LBB29_80
.LBB29_78:                              # Block address taken
                                        #   in Loop: Header=BB29_10 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rdx, %rsi
	shrq	%rsi
	retq
.LBB29_80:                              # Block address taken
                                        #   in Loop: Header=BB29_37 Depth=2
                                        # Label of block must be emitted
	cmpq	%rdx, %rsi
	setb	%dil
	cmovneq	%rdi, %rcx
	movq	%rsi, 16(%rsp,%rax,8)
	jmp	.LBB29_54
.LBB29_54:                              # Block address taken
                                        #   in Loop: Header=BB29_37 Depth=2
                                        # Label of block must be emitted
	incq	%rax
	jmp	.LBB29_68
.LBB29_66:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movzbl	%r14b, %r12d
	xorl	%eax, %eax
	retq
.LBB29_68:                              # Block address taken
                                        #   in Loop: Header=BB29_37 Depth=2
                                        # Label of block must be emitted
	cmpq	%rax, %r12
	jne	.LBB29_37
.LBB29_38:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	xorl	%eax, %eax
	jmp	.LBB29_119
.LBB29_117:                             # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	shlq	$3, %r12
	xorl	%esi, %esi
	retq
.LBB29_119:                             # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	xorl	%ecx, %ecx
.LBB29_39:                              # Block address taken
                                        #   Parent Loop BB29_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	48(%rsp,%rax,8), %rdx
	subq	$224, %rsp
	callq	.LBB29_102
.LBB29_103:                             # Block address taken
                                        #   in Loop: Header=BB29_39 Depth=2
                                        # Label of block must be emitted
	addq	$224, %rsp
	subq	%rdx, 16(%rsp,%rax,8)
	setb	%sil
	testq	%rdx, %rdx
	cmovneq	%rsi, %rcx
	incq	%rax
	jmp	.LBB29_55
.LBB29_55:                              # Block address taken
                                        #   in Loop: Header=BB29_39 Depth=2
                                        # Label of block must be emitted
	cmpq	%rax, %r12
	jne	.LBB29_39
	jmp	.LBB29_40
.LBB29_15:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	xorl	%ecx, %ecx
.LBB29_16:                              # Block address taken
                                        #   Parent Loop BB29_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	128(%rsp,%rax,8), %rdx
	subq	$224, %rsp
	callq	.LBB29_105
.LBB29_106:                             # Block address taken
                                        #   in Loop: Header=BB29_16 Depth=2
                                        # Label of block must be emitted
	addq	$224, %rsp
	subq	%rdx, 96(%rsp,%rax,8)
	setb	%sil
	testq	%rdx, %rdx
	cmovneq	%rsi, %rcx
	incq	%rax
	jmp	.LBB29_56
.LBB29_56:                              # Block address taken
                                        #   in Loop: Header=BB29_16 Depth=2
                                        # Label of block must be emitted
	cmpq	%rax, %r12
	jne	.LBB29_16
.LBB29_17:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	movq	8(%rsp), %rax                   # 8-byte Reload
	xorl	%ecx, %ecx
.LBB29_18:                              # Block address taken
                                        #   Parent Loop BB29_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	-8(%rax), %rdx
	subq	$224, %rsp
	callq	.LBB29_108
.LBB29_109:                             # Block address taken
                                        #   in Loop: Header=BB29_18 Depth=2
                                        # Label of block must be emitted
	addq	$224, %rsp
	orq	%rcx, %rsi
	jmp	.LBB29_71
.LBB29_69:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rdi
	movq	%r13, %rdx
	retq
.LBB29_71:                              # Block address taken
                                        #   in Loop: Header=BB29_18 Depth=2
                                        # Label of block must be emitted
	movq	%rsi, -8(%rax)
	leaq	-8(%rax), %rsi
	shlq	$63, %rdx
	movq	%rsi, %rax
	jmp	.LBB29_57
.LBB29_57:                              # Block address taken
                                        #   in Loop: Header=BB29_18 Depth=2
                                        # Label of block must be emitted
	movq	%rdx, %rcx
	cmpq	%rbx, %rsi
	ja	.LBB29_18
.LBB29_19:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	movl	4(%rsp), %eax                   # 4-byte Reload
                                        # kill: def $al killed $al killed $eax
.LBB29_20:                              # Block address taken
                                        #   Parent Loop BB29_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	testb	%al, %al
	js	.LBB29_25
.LBB29_21:                              # Block address taken
                                        #   in Loop: Header=BB29_20 Depth=2
                                        # Label of block must be emitted
	movzbl	%al, %edx
	movq	48(%rsp,%rdx,8), %rcx
	movq	16(%rsp,%rdx,8), %rdx
	cmpq	%rdx, %rcx
	ja	.LBB29_25
.LBB29_22:                              # Block address taken
                                        #   in Loop: Header=BB29_20 Depth=2
                                        # Label of block must be emitted
	decb	%al
	jmp	.LBB29_104
.LBB29_102:                             # Block address taken
                                        #   in Loop: Header=BB29_39 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%rcx, %rdx
	xorl	%esi, %esi
	retq
.LBB29_104:                             # Block address taken
                                        #   in Loop: Header=BB29_20 Depth=2
                                        # Label of block must be emitted
	cmpq	%rdx, %rcx
	jae	.LBB29_20
.LBB29_23:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	xorl	%eax, %eax
	jmp	.LBB29_89
.LBB29_87:                              # Block address taken
                                        #   in Loop: Header=BB29_13 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leaq	-8(%rax), %rsi
	shlq	$63, %rdx
	retq
.LBB29_89:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	xorl	%ecx, %ecx
.LBB29_24:                              # Block address taken
                                        #   Parent Loop BB29_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	48(%rsp,%rax,8), %rdx
	subq	$224, %rsp
	callq	.LBB29_111
.LBB29_112:                             # Block address taken
                                        #   in Loop: Header=BB29_24 Depth=2
                                        # Label of block must be emitted
	addq	$224, %rsp
	xorl	%edi, %edi
	cmpq	%rdx, %rsi
	setb	%dil
	cmovneq	%rdi, %rcx
	movq	%rsi, 48(%rsp,%rax,8)
	jmp	.LBB29_58
.LBB29_58:                              # Block address taken
                                        #   in Loop: Header=BB29_24 Depth=2
                                        # Label of block must be emitted
	incq	%rax
	cmpq	%rax, %r12
	jne	.LBB29_24
.LBB29_25:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	xorl	%eax, %eax
	xorl	%ecx, %ecx
.LBB29_26:                              # Block address taken
                                        #   Parent Loop BB29_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	16(%rsp,%rax,8), %rdx
	subq	$224, %rsp
	callq	.LBB29_114
.LBB29_115:                             # Block address taken
                                        #   in Loop: Header=BB29_26 Depth=2
                                        # Label of block must be emitted
	addq	$224, %rsp
	subq	%rdx, 48(%rsp,%rax,8)
	setb	%sil
	testq	%rdx, %rdx
	cmovneq	%rsi, %rcx
	incq	%rax
	jmp	.LBB29_59
.LBB29_59:                              # Block address taken
                                        #   in Loop: Header=BB29_26 Depth=2
                                        # Label of block must be emitted
	cmpq	%rax, %r12
	jne	.LBB29_26
.LBB29_27:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	leaq	48(%rsp), %rdi
.LBB29_41:                              # Block address taken
                                        #   in Loop: Header=BB29_5 Depth=1
                                        # Label of block must be emitted
	movsbl	%r14b, %edx
	movq	%r15, %rsi
	callq	vli_modInv_update
	jmp	.LBB29_5
.LBB29_42:                              # Block address taken
                                        # Label of block must be emitted
	leaq	16(%rsp), %rsi
	movq	88(%rsp), %rdi                  # 8-byte Reload
	movq	80(%rsp), %rdx                  # 8-byte Reload
	callq	memcpy@PLT
.LBB29_43:                              # Block address taken
                                        # Label of block must be emitted
	addq	$168, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	jmp	.LBB29_60
.LBB29_60:                              # Block address taken
                                        # Label of block must be emitted
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	popq	%rbp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	retq
.LBB29_44:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 224
	subq	$224, %rsp
	callq	.LBB29_117
.LBB29_118:                             # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	movq	%r12, %rdx
	jmp	.LBB29_74
.LBB29_72:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	xorl	%esi, %esi
	movq	%r13, %rdx
	retq
.LBB29_74:                              # Block address taken
                                        # Label of block must be emitted
	addq	$168, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	jmp	.LBB29_61
.LBB29_61:                              # Block address taken
                                        # Label of block must be emitted
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	jmp	.LBB29_62
.LBB29_62:                              # Block address taken
                                        # Label of block must be emitted
	popq	%rbp
	.cfi_def_cfa_offset 8
	popq	%rbp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	jmp	memset@PLT                      # TAILCALL
.Lfunc_end29:
	.size	uECC_vli_modInv, .Lfunc_end29-uECC_vli_modInv
	.cfi_endproc
                                        # -- End function
	.type	uECC_vli_modMult,@function      # -- Begin function uECC_vli_modMult
uECC_vli_modMult:                       # @uECC_vli_modMult
	.cfi_startproc
# %bb.0:                                # Block address taken
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushq	%rbp
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	jmp	.LBB30_25
.LBB30_25:                              # Block address taken
                                        # Label of block must be emitted
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	jmp	.LBB30_26
.LBB30_26:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_offset %r13, -40
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_37
.LBB30_38:                              # Block address taken
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	.cfi_offset %rbp, -16
	movl	%r8d, %r14d
	movq	%rcx, %r15
	movq	%rdi, 24(%rsp)                  # 8-byte Spill
	leaq	112(%rsp), %r12
	jmp	.LBB30_27
.LBB30_27:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r12, %rdi
	movl	%r8d, %ecx
	jmp	.LBB30_81
.LBB30_79:                              # Block address taken
                                        #   in Loop: Header=BB30_13 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rcx, (%r15,%rbp,8)
	retq
.LBB30_81:                              # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_mult
	jmp	.LBB30_60
.LBB30_58:                              # Block address taken
                                        #   in Loop: Header=BB30_5 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r9, %r10
	movl	%eax, %ecx
	retq
.LBB30_60:                              # Block address taken
                                        # Label of block must be emitted
	leaq	176(%rsp), %rax
	movq	%rax, (%rsp)
	movq	%r12, 8(%rsp)
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_40
.LBB30_41:                              # Block address taken
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	jmp	.LBB30_28
.LBB30_28:                              # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_numBits
	jmp	.LBB30_57
.LBB30_55:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	$48, %rsi
	xorl	%edi, %edi
	retq
.LBB30_57:                              # Block address taken
                                        # Label of block must be emitted
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_43
.LBB30_44:                              # Block address taken
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	shll	$7, %r12d
	subl	%eax, %r12d
	leal	63(%r12), %eax
	testw	%r12w, %r12w
	cmovnsl	%r12d, %eax
	jmp	.LBB30_29
.LBB30_29:                              # Block address taken
                                        # Label of block must be emitted
	movswl	%ax, %ebp
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_46
.LBB30_47:                              # Block address taken
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	jmp	.LBB30_90
.LBB30_88:                              # Block address taken
                                        #   in Loop: Header=BB30_17 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rcx, %rdi
	shrq	%rdi
	retq
.LBB30_90:                              # Block address taken
                                        # Label of block must be emitted
	andl	$-64, %eax
	jmp	.LBB30_45
.LBB30_43:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
                                        # kill: def $ax killed $ax def $eax
	movl	%r14d, %r12d
	retq
.LBB30_45:                              # Block address taken
                                        # Label of block must be emitted
	movl	%r12d, %ebx
	subl	%eax, %ebx
	testb	%bpl, %bpl
	jle	.LBB30_2
.LBB30_1:                               # Block address taken
                                        # Label of block must be emitted
	movzbl	%cl, %edx
	shll	$3, %edx
	jmp	.LBB30_75
.LBB30_73:                              # Block address taken
                                        #   in Loop: Header=BB30_11 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r9, %r10
	xorq	$1, %r10
	retq
.LBB30_75:                              # Block address taken
                                        # Label of block must be emitted
	leaq	48(%rsp), %rdi
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_49
.LBB30_50:                              # Block address taken
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	callq	memset@PLT
	movl	%r13d, %ecx
.LBB30_2:                               # Block address taken
                                        # Label of block must be emitted
	movsbq	%r14b, %r13
	testw	%bx, %bx
	jle	.LBB30_6
.LBB30_3:                               # Block address taken
                                        # Label of block must be emitted
	testb	%r14b, %r14b
	je	.LBB30_8
.LBB30_4:                               # Block address taken
                                        # Label of block must be emitted
	movswl	%bx, %ecx
	jmp	.LBB30_66
.LBB30_64:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	$48, %rdi
	movzbl	%r14b, %edx
	retq
.LBB30_66:                              # Block address taken
                                        # Label of block must be emitted
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_52
.LBB30_53:                              # Block address taken
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	movl	$64, %edx
	subl	%ecx, %edx
	jmp	.LBB30_78
.LBB30_76:                              # Block address taken
                                        #   in Loop: Header=BB30_13 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leal	-1(%r13), %r10d
	movsbq	%r10b, %rbp
	retq
.LBB30_78:                              # Block address taken
                                        # Label of block must be emitted
	leaq	(%rsp,%rsi,8), %rsi
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_55
.LBB30_56:                              # Block address taken
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	jmp	.LBB30_30
.LBB30_30:                              # Block address taken
                                        # Label of block must be emitted
	xorl	%r8d, %r8d
.LBB30_5:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	(%r15,%rdi,8), %r9
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_58
.LBB30_59:                              # Block address taken
                                        #   in Loop: Header=BB30_5 Depth=1
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	shlq	%cl, %r10
	jmp	.LBB30_63
.LBB30_61:                              # Block address taken
                                        #   in Loop: Header=BB30_5 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movl	%edx, %ecx
	shrq	%cl, %r9
	retq
.LBB30_63:                              # Block address taken
                                        #   in Loop: Header=BB30_5 Depth=1
                                        # Label of block must be emitted
	orq	%r8, %r10
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_61
.LBB30_62:                              # Block address taken
                                        #   in Loop: Header=BB30_5 Depth=1
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	movq	%r10, (%rsi,%rdi,8)
	jmp	.LBB30_31
.LBB30_31:                              # Block address taken
                                        #   in Loop: Header=BB30_5 Depth=1
                                        # Label of block must be emitted
	incq	%rdi
	movq	%r9, %r8
	jmp	.LBB30_84
.LBB30_82:                              # Block address taken
                                        #   in Loop: Header=BB30_15 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rcx, %rdi
	shrq	%rdi
	retq
.LBB30_84:                              # Block address taken
                                        #   in Loop: Header=BB30_5 Depth=1
                                        # Label of block must be emitted
	cmpq	%rdi, %r13
	jne	.LBB30_5
	jmp	.LBB30_8
.LBB30_6:                               # Block address taken
                                        # Label of block must be emitted
	testb	%r14b, %r14b
	jle	.LBB30_8
.LBB30_7:                               # Block address taken
                                        # Label of block must be emitted
	movsbl	%cl, %eax
	cltq
	leaq	(%rsp,%rax,8), %rdi
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_64
.LBB30_65:                              # Block address taken
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	shlq	$3, %rdx
	movq	%r15, %rsi
	callq	memcpy@PLT
.LBB30_8:                               # Block address taken
                                        # Label of block must be emitted
	testw	%r12w, %r12w
	js	.LBB30_9
.LBB30_10:                              # Block address taken
                                        # Label of block must be emitted
	leal	(%r14,%r14), %eax
	movzbl	%r14b, %edi
	leaq	(%rsp,%rdi,8), %rcx
	addq	$48, %rcx
	movq	%rcx, 40(%rsp)                  # 8-byte Spill
	leaq	(%rsp,%r13,8), %rdx
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_67
.LBB30_68:                              # Block address taken
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	jmp	.LBB30_32
.LBB30_32:                              # Block address taken
                                        # Label of block must be emitted
	decl	%esi
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_70
.LBB30_71:                              # Block address taken
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	movq	%rcx, 32(%rsp)                  # 8-byte Spill
	movl	$1, %r9d
	leaq	48(%rsp), %r8
.LBB30_11:                              # Block address taken
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB30_13 Depth 2
                                        #     Child Loop BB30_15 Depth 2
                                        #     Child Loop BB30_17 Depth 2
                                        # Label of block must be emitted
	testb	%r14b, %r14b
	jmp	.LBB30_69
.LBB30_67:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	$48, %rdx
	movl	%r14d, %esi
	retq
.LBB30_69:                              # Block address taken
                                        #   in Loop: Header=BB30_11 Depth=1
                                        # Label of block must be emitted
	jle	.LBB30_24
.LBB30_12:                              # Block address taken
                                        #   in Loop: Header=BB30_11 Depth=1
                                        # Label of block must be emitted
	movq	(%rsp,%r9,8), %r11
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_73
.LBB30_74:                              # Block address taken
                                        #   in Loop: Header=BB30_11 Depth=1
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	movq	(%rsp,%r10,8), %r15
	movb	$1, %r13b
	xorl	%r10d, %r10d
.LBB30_13:                              # Block address taken
                                        #   Parent Loop BB30_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	%r10, %rbx
	jmp	.LBB30_93
.LBB30_91:                              # Block address taken
                                        #   in Loop: Header=BB30_17 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leaq	-8(%r11), %rdi
	shlq	$63, %rcx
	retq
.LBB30_93:                              # Block address taken
                                        #   in Loop: Header=BB30_13 Depth=2
                                        # Label of block must be emitted
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_76
.LBB30_77:                              # Block address taken
                                        #   in Loop: Header=BB30_13 Depth=2
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	movq	(%r11,%rbp,8), %rcx
	movq	48(%rsp,%rbp,8), %rdi
	addq	%rbx, %rdi
	xorl	%r10d, %r10d
	subq	%rdi, %rcx
	jmp	.LBB30_33
.LBB30_33:                              # Block address taken
                                        #   in Loop: Header=BB30_13 Depth=2
                                        # Label of block must be emitted
	setb	%r10b
	testq	%rdi, %rdi
	cmoveq	%rbx, %r10
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_79
.LBB30_80:                              # Block address taken
                                        #   in Loop: Header=BB30_13 Depth=2
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	movsbl	%r13b, %ecx
	leal	1(%rcx), %r13d
	cmpl	%ecx, %eax
	jg	.LBB30_13
.LBB30_14:                              # Block address taken
                                        #   in Loop: Header=BB30_11 Depth=1
                                        # Label of block must be emitted
	movq	40(%rsp), %r11                  # 8-byte Reload
	jmp	.LBB30_39
.LBB30_37:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	retq
.LBB30_39:                              # Block address taken
                                        #   in Loop: Header=BB30_11 Depth=1
                                        # Label of block must be emitted
	xorl	%ebx, %ebx
.LBB30_15:                              # Block address taken
                                        #   Parent Loop BB30_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	-8(%r11), %rcx
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_82
.LBB30_83:                              # Block address taken
                                        #   in Loop: Header=BB30_15 Depth=2
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	orq	%rbx, %rdi
	movq	%rdi, -8(%r11)
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_85
.LBB30_86:                              # Block address taken
                                        #   in Loop: Header=BB30_15 Depth=2
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	movq	%rdi, %r11
	jmp	.LBB30_34
.LBB30_34:                              # Block address taken
                                        #   in Loop: Header=BB30_15 Depth=2
                                        # Label of block must be emitted
	movq	%rcx, %rbx
	jmp	.LBB30_72
.LBB30_70:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movslq	%esi, %rsi
	leaq	(%rdx,%rdi,8), %rcx
	retq
.LBB30_72:                              # Block address taken
                                        #   in Loop: Header=BB30_15 Depth=2
                                        # Label of block must be emitted
	cmpq	%r8, %rdi
	ja	.LBB30_15
.LBB30_16:                              # Block address taken
                                        #   in Loop: Header=BB30_11 Depth=1
                                        # Label of block must be emitted
	movq	(%rdx), %rcx
	shlq	$63, %rcx
	orq	%rcx, 48(%rsp,%rsi,8)
	movq	32(%rsp), %r11                  # 8-byte Reload
	xorl	%ebx, %ebx
.LBB30_17:                              # Block address taken
                                        #   Parent Loop BB30_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	-8(%r11), %rcx
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_88
.LBB30_89:                              # Block address taken
                                        #   in Loop: Header=BB30_17 Depth=2
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	orq	%rbx, %rdi
	movq	%rdi, -8(%r11)
	subq	$304, %rsp                      # imm = 0x130
	callq	.LBB30_91
.LBB30_92:                              # Block address taken
                                        #   in Loop: Header=BB30_17 Depth=2
                                        # Label of block must be emitted
	addq	$304, %rsp                      # imm = 0x130
	movq	%rdi, %r11
	jmp	.LBB30_35
.LBB30_35:                              # Block address taken
                                        #   in Loop: Header=BB30_17 Depth=2
                                        # Label of block must be emitted
	movq	%rcx, %rbx
	jmp	.LBB30_51
.LBB30_49:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	xorl	%esi, %esi
	movl	%ecx, %r13d
	retq
.LBB30_51:                              # Block address taken
                                        #   in Loop: Header=BB30_17 Depth=2
                                        # Label of block must be emitted
	cmpq	%rdx, %rdi
	ja	.LBB30_17
.LBB30_18:                              # Block address taken
                                        #   in Loop: Header=BB30_11 Depth=1
                                        # Label of block must be emitted
	cmpq	%r10, %r9
	jmp	.LBB30_54
.LBB30_52:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movl	%ecx, %eax
	movsbq	%bpl, %rsi
	retq
.LBB30_54:                              # Block address taken
                                        #   in Loop: Header=BB30_11 Depth=1
                                        # Label of block must be emitted
	sete	%r9b
	jmp	.LBB30_19
.LBB30_24:                              # Block address taken
                                        #   in Loop: Header=BB30_11 Depth=1
                                        # Label of block must be emitted
	testq	%r9, %r9
	sete	%r9b
	jmp	.LBB30_87
.LBB30_85:                              # Block address taken
                                        #   in Loop: Header=BB30_15 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leaq	-8(%r11), %rdi
	shlq	$63, %rcx
	retq
.LBB30_87:                              # Block address taken
                                        #   in Loop: Header=BB30_11 Depth=1
                                        # Label of block must be emitted
	movq	(%rdx), %rcx
	shlq	$63, %rcx
	orq	%rcx, 48(%rsp,%rsi,8)
.LBB30_19:                              # Block address taken
                                        #   in Loop: Header=BB30_11 Depth=1
                                        # Label of block must be emitted
	movzbl	%r9b, %r9d
	leal	-1(%r12), %ecx
	testw	%r12w, %r12w
	movl	%ecx, %r12d
	jg	.LBB30_11
	jmp	.LBB30_20
.LBB30_9:                               # Block address taken
                                        # Label of block must be emitted
	movl	$1, %r9d
.LBB30_20:                              # Block address taken
                                        # Label of block must be emitted
	testb	%r14b, %r14b
	movq	24(%rsp), %rdi                  # 8-byte Reload
	jle	.LBB30_23
.LBB30_21:                              # Block address taken
                                        # Label of block must be emitted
	movq	(%rsp,%r9,8), %rax
	jmp	.LBB30_42
.LBB30_40:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r15, %rdi
	movl	%r14d, %esi
	retq
.LBB30_42:                              # Block address taken
                                        # Label of block must be emitted
	movzbl	%r14b, %ecx
	xorl	%edx, %edx
.LBB30_22:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	(%rax,%rdx,8), %rsi
	movq	%rsi, (%rdi,%rdx,8)
	jmp	.LBB30_48
.LBB30_46:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	sarl	$6, %ebp
	movzwl	%bp, %ecx
	retq
.LBB30_48:                              # Block address taken
                                        #   in Loop: Header=BB30_22 Depth=1
                                        # Label of block must be emitted
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.LBB30_22
.LBB30_23:                              # Block address taken
                                        # Label of block must be emitted
	addq	$248, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	jmp	.LBB30_36
.LBB30_36:                              # Block address taken
                                        # Label of block must be emitted
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	popq	%rbp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	retq
.Lfunc_end30:
	.size	uECC_vli_modMult, .Lfunc_end30-uECC_vli_modMult
	.cfi_endproc
                                        # -- End function
	.type	uECC_vli_modSub,@function       # -- Begin function uECC_vli_modSub
uECC_vli_modSub:                        # @uECC_vli_modSub
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	testb	%r8b, %r8b
	jle	.LBB31_6
# %bb.1:
	movzbl	%r8b, %eax
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
.LBB31_2:                               # =>This Inner Loop Header: Depth=1
	movq	%r9, %r10
	movq	(%rsi,%r8,8), %r11
	movq	(%rdx,%r8,8), %rbx
	addq	%r9, %rbx
	xorl	%r9d, %r9d
	subq	%rbx, %r11
	setb	%r9b
	testq	%rbx, %rbx
	cmoveq	%r10, %r9
	movq	%r11, (%rdi,%r8,8)
	incq	%r8
	cmpq	%r8, %rax
	jne	.LBB31_2
# %bb.3:
	testq	%r9, %r9
	je	.LBB31_6
# %bb.4:
	xorl	%edx, %edx
	xorl	%esi, %esi
.LBB31_5:                               # =>This Inner Loop Header: Depth=1
	movq	(%rdi,%rdx,8), %r8
	leaq	(%r8,%rsi), %r9
	addq	(%rcx,%rdx,8), %r9
	xorl	%r10d, %r10d
	cmpq	%r8, %r9
	setb	%r10b
	cmovneq	%r10, %rsi
	movq	%r9, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	%rdx, %rax
	jne	.LBB31_5
.LBB31_6:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end31:
	.size	uECC_vli_modSub, .Lfunc_end31-uECC_vli_modSub
	.cfi_endproc
                                        # -- End function
	.type	XYcZ_add,@function              # -- Begin function XYcZ_add
XYcZ_add:                               # @XYcZ_add
	.cfi_startproc
# %bb.0:                                # Block address taken
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushq	%rbp
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	jmp	.LBB32_3
.LBB32_3:                               # Block address taken
                                        # Label of block must be emitted
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	jmp	.LBB32_4
.LBB32_4:                               # Block address taken
                                        # Label of block must be emitted
	.cfi_offset %r13, -40
	jmp	.LBB32_21
.LBB32_19:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	retq
.LBB32_21:                              # Block address taken
                                        # Label of block must be emitted
	subq	$192, %rsp
	callq	.LBB32_19
.LBB32_20:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	.cfi_offset %rbp, -16
	movq	%r8, %r13
	subq	$192, %rsp
	callq	.LBB32_22
.LBB32_23:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	movq	%rsi, 8(%rsp)                   # 8-byte Spill
	jmp	.LBB32_5
.LBB32_5:                               # Block address taken
                                        # Label of block must be emitted
	movq	%rdi, %rdx
	movq	%rdi, 16(%rsp)                  # 8-byte Spill
	subq	$192, %rsp
	callq	.LBB32_25
.LBB32_26:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	leaq	32(%rsp), %r12
	movq	%r12, %rdi
	jmp	.LBB32_33
.LBB32_31:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r15, %rdi
	movq	%r15, %rsi
	retq
.LBB32_33:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbx, %rsi
	movq	%rbp, %rcx
	jmp	.LBB32_6
.LBB32_6:                               # Block address taken
                                        # Label of block must be emitted
	movq	%rbp, 24(%rsp)                  # 8-byte Spill
	jmp	.LBB32_42
.LBB32_40:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rdi, %rsi
	movq	%rbx, %rdx
	retq
.LBB32_42:                              # Block address taken
                                        # Label of block must be emitted
	movl	%r14d, %r8d
	jmp	.LBB32_30
.LBB32_28:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rsi
	movq	%r12, %rdx
	retq
.LBB32_30:                              # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_modSub
	leaq	64(%rsp), %rdi
	subq	$192, %rsp
	callq	.LBB32_28
.LBB32_29:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	movl	%r14d, %ecx
	callq	uECC_vli_mult
	jmp	.LBB32_7
.LBB32_7:                               # Block address taken
                                        # Label of block must be emitted
	movq	%r12, %rdi
	leaq	64(%rsp), %rsi
	callq	*192(%r13)
	movsbl	(%r13), %ecx
	leaq	64(%rsp), %rdi
	movq	16(%rsp), %r12                  # 8-byte Reload
	movq	%r12, %rsi
	leaq	32(%rsp), %rdx
	jmp	.LBB32_8
.LBB32_8:                               # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_mult
	movq	%r12, %rdi
	jmp	.LBB32_45
.LBB32_43:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rsi
	movq	%r12, %rdx
	retq
.LBB32_45:                              # Block address taken
                                        # Label of block must be emitted
	leaq	64(%rsp), %rsi
	callq	*192(%r13)
	jmp	.LBB32_24
.LBB32_22:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rcx, %r15
	movq	%rdx, %rbx
	retq
.LBB32_24:                              # Block address taken
                                        # Label of block must be emitted
	movsbl	(%r13), %ecx
	leaq	64(%rsp), %rdi
	movq	%rbx, %rsi
	leaq	32(%rsp), %r12
	jmp	.LBB32_9
.LBB32_9:                               # Block address taken
                                        # Label of block must be emitted
	movq	%r12, %rdx
	callq	uECC_vli_mult
	movq	%rbx, %rdi
	jmp	.LBB32_39
.LBB32_37:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rdi
	movq	%r12, %rsi
	retq
.LBB32_39:                              # Block address taken
                                        # Label of block must be emitted
	leaq	64(%rsp), %rsi
	callq	*192(%r13)
	subq	$192, %rsp
	callq	.LBB32_31
.LBB32_32:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	movq	8(%rsp), %rdx                   # 8-byte Reload
	jmp	.LBB32_10
.LBB32_10:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbp, %rcx
	movl	%r14d, %r8d
	callq	uECC_vli_modSub
	movsbl	(%r13), %ecx
	leaq	64(%rsp), %rdi
	subq	$192, %rsp
	callq	.LBB32_34
.LBB32_35:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	callq	uECC_vli_mult
	jmp	.LBB32_11
.LBB32_11:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r12, %rdi
	leaq	64(%rsp), %rsi
	callq	*192(%r13)
	subq	$192, %rsp
	callq	.LBB32_37
.LBB32_38:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	movq	16(%rsp), %r12                  # 8-byte Reload
	jmp	.LBB32_48
.LBB32_46:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rsi
	movq	%rbx, %rdx
	retq
.LBB32_48:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r12, %rdx
	movq	%rbp, %rcx
	jmp	.LBB32_12
.LBB32_12:                              # Block address taken
                                        # Label of block must be emitted
	movl	%r14d, %r8d
	callq	uECC_vli_modSub
	leaq	32(%rsp), %rdi
	subq	$192, %rsp
	callq	.LBB32_40
.LBB32_41:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	movq	%rbp, %rcx
	movl	%r14d, %r8d
	callq	uECC_vli_modSub
	jmp	.LBB32_13
.LBB32_13:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbx, %rdi
	subq	$192, %rsp
	callq	.LBB32_43
.LBB32_44:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	movq	%rbp, %rcx
	movl	%r14d, %r8d
	callq	uECC_vli_modSub
	movsbl	(%r13), %ecx
	leaq	64(%rsp), %rdi
	jmp	.LBB32_14
.LBB32_14:                              # Block address taken
                                        # Label of block must be emitted
	movq	8(%rsp), %rbp                   # 8-byte Reload
	subq	$192, %rsp
	callq	.LBB32_46
.LBB32_47:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	callq	uECC_vli_mult
	movq	%rbp, %rdi
	leaq	64(%rsp), %rsi
	callq	*192(%r13)
	movq	%rbx, %rdi
	jmp	.LBB32_15
.LBB32_15:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r12, %rsi
	leaq	32(%rsp), %rdx
	movq	24(%rsp), %rbp                  # 8-byte Reload
	subq	$192, %rsp
	callq	.LBB32_49
.LBB32_50:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	jmp	.LBB32_54
.LBB32_52:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r15, %rsi
	movq	%rbx, %rdx
	retq
.LBB32_54:                              # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_modSub
	jmp	.LBB32_51
.LBB32_49:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rcx
	movl	%r14d, %r8d
	retq
.LBB32_51:                              # Block address taken
                                        # Label of block must be emitted
	movsbl	(%r13), %ecx
	leaq	64(%rsp), %r12
	jmp	.LBB32_16
.LBB32_16:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r12, %rdi
	subq	$192, %rsp
	callq	.LBB32_52
.LBB32_53:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	callq	uECC_vli_mult
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	*192(%r13)
	movq	%r15, %rdi
	jmp	.LBB32_17
.LBB32_17:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r15, %rsi
	movq	8(%rsp), %rdx                   # 8-byte Reload
	subq	$192, %rsp
	callq	.LBB32_55
.LBB32_56:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	callq	uECC_vli_modSub
	testl	%r14d, %r14d
	jle	.LBB32_2
.LBB32_1:                               # Block address taken
                                        # Label of block must be emitted
	movzbl	%r14b, %edx
	shlq	$3, %rdx
	leaq	32(%rsp), %rsi
	movq	%rbx, %rdi
	callq	memcpy@PLT
.LBB32_2:                               # Block address taken
                                        # Label of block must be emitted
	addq	$136, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	jmp	.LBB32_18
.LBB32_18:                              # Block address taken
                                        # Label of block must be emitted
	popq	%r14
	jmp	.LBB32_57
.LBB32_55:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rcx
	movl	%r14d, %r8d
	retq
.LBB32_57:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 24
	jmp	.LBB32_36
.LBB32_34:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r15, %rsi
	movq	%r15, %rdx
	retq
.LBB32_36:                              # Block address taken
                                        # Label of block must be emitted
	popq	%r15
	jmp	.LBB32_27
.LBB32_25:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movsbl	(%r8), %r14d
	leaq	8(%r8), %rbp
	retq
.LBB32_27:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	popq	%rbp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	retq
.Lfunc_end32:
	.size	XYcZ_add, .Lfunc_end32-XYcZ_add
	.cfi_endproc
                                        # -- End function
	.type	apply_z,@function               # -- Begin function apply_z
apply_z:                                # @apply_z
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rcx, %rbx
	movq	%rdx, %r12
	movq	%rsi, %r14
	movq	%rdi, %r13
	movsbl	(%rcx), %ecx
	movq	%rsp, %rbp
	movq	%rbp, %rdi
	movq	%rdx, %rsi
	callq	uECC_vli_mult
	leaq	64(%rsp), %r15
	movq	%r15, %rdi
	movq	%rbp, %rsi
	callq	*192(%rbx)
	movsbl	(%rbx), %ecx
	movq	%rsp, %rbp
	movq	%rbp, %rdi
	movq	%r13, %rsi
	movq	%r15, %rdx
	callq	uECC_vli_mult
	movq	%r13, %rdi
	movq	%rbp, %rsi
	callq	*192(%rbx)
	movsbl	(%rbx), %ecx
	movq	%rsp, %r13
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	callq	uECC_vli_mult
	movq	%r15, %rdi
	movq	%r13, %rsi
	callq	*192(%rbx)
	movsbl	(%rbx), %ecx
	movq	%rsp, %r12
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	callq	uECC_vli_mult
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	*192(%rbx)
	addq	$104, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end33:
	.size	apply_z, .Lfunc_end33-apply_z
	.cfi_endproc
                                        # -- End function
	.type	uECC_vli_numBits,@function      # -- Begin function uECC_vli_numBits
uECC_vli_numBits:                       # @uECC_vli_numBits
	.cfi_startproc
# %bb.0:
                                        # kill: def $esi killed $esi def $rsi
	leal	-1(%rsi), %eax
	movzbl	%al, %ecx
	cmpb	$-1, %cl
	movl	$255, %eax
	cmovll	%ecx, %eax
	incb	%al
	incb	%sil
.LBB34_1:                               # =>This Inner Loop Header: Depth=1
	movl	%esi, %ecx
	addb	$-2, %cl
	js	.LBB34_3
# %bb.2:                                #   in Loop: Header=BB34_1 Depth=1
	movzbl	%cl, %ecx
	decb	%sil
	cmpq	$0, (%rdi,%rcx,8)
	je	.LBB34_1
	jmp	.LBB34_4
.LBB34_3:
	movl	%eax, %esi
	testb	%al, %al
	je	.LBB34_8
.LBB34_4:
	movsbl	%sil, %eax
	leal	-1(%rax), %ecx
	movsbq	%al, %rax
	movq	-8(%rdi,%rax,8), %rdx
	xorl	%eax, %eax
	testq	%rdx, %rdx
	je	.LBB34_7
# %bb.5:
	movq	%rdx, %rsi
.LBB34_6:                               # =>This Inner Loop Header: Depth=1
	shrq	%rsi
	incq	%rax
	cmpq	$1, %rdx
	movq	%rsi, %rdx
	ja	.LBB34_6
.LBB34_7:
	shll	$6, %ecx
	addl	%ecx, %eax
                                        # kill: def $ax killed $ax killed $rax
	retq
.LBB34_8:
	xorl	%eax, %eax
                                        # kill: def $ax killed $ax killed $rax
	retq
.Lfunc_end34:
	.size	uECC_vli_numBits, .Lfunc_end34-uECC_vli_numBits
	.cfi_endproc
                                        # -- End function
	.type	default_RNG,@function           # -- Begin function default_RNG
default_RNG:                            # @default_RNG
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%esi, %r15d
	movq	%rdi, %r14
	leaq	.L.str(%rip), %rdi
	xorl	%ebx, %ebx
	movl	$524288, %esi                   # imm = 0x80000
	xorl	%eax, %eax
	callq	open@PLT
	movl	%eax, %ebp
	cmpl	$-1, %eax
	jne	.LBB35_2
# %bb.1:
	leaq	.L.str.1(%rip), %rdi
	movl	$524288, %esi                   # imm = 0x80000
	xorl	%eax, %eax
	callq	open@PLT
	movl	%eax, %ebp
	cmpl	$-1, %eax
	je	.LBB35_8
.LBB35_2:
	movl	$1, %ebx
	testl	%r15d, %r15d
	je	.LBB35_7
# %bb.3:
	movl	%r15d, %r15d
.LBB35_4:                               # =>This Inner Loop Header: Depth=1
	movl	%ebp, %edi
	movq	%r14, %rsi
	movq	%r15, %rdx
	callq	read@PLT
	testq	%rax, %rax
	jle	.LBB35_5
# %bb.6:                                #   in Loop: Header=BB35_4 Depth=1
	addq	%rax, %r14
	subq	%rax, %r15
	jne	.LBB35_4
	jmp	.LBB35_7
.LBB35_5:
	xorl	%ebx, %ebx
.LBB35_7:
	movl	%ebp, %edi
	callq	close@PLT
.LBB35_8:
	movl	%ebx, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end35:
	.size	default_RNG, .Lfunc_end35-default_RNG
	.cfi_endproc
                                        # -- End function
	.type	double_jacobian_default,@function # -- Begin function double_jacobian_default
double_jacobian_default:                # @double_jacobian_default
	.cfi_startproc
# %bb.0:                                # Block address taken
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushq	%rbp
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	jmp	.LBB36_18
.LBB36_18:                              # Block address taken
                                        # Label of block must be emitted
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	jmp	.LBB36_102
.LBB36_100:                             # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdx
	movq	%rbp, %rcx
	retq
.LBB36_102:                             # Block address taken
                                        # Label of block must be emitted
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	jmp	.LBB36_19
.LBB36_19:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_offset %r13, -40
	jmp	.LBB36_99
.LBB36_97:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdi
	movq	%r14, %rsi
	retq
.LBB36_99:                              # Block address taken
                                        # Label of block must be emitted
	subq	$224, %rsp
	callq	.LBB36_40
.LBB36_41:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	.cfi_offset %rbp, -16
	movsbq	(%rcx), %r8
	testq	%r8, %r8
	jle	.LBB36_17
.LBB36_1:                               # Block address taken
                                        # Label of block must be emitted
	movq	%rcx, %r13
	jmp	.LBB36_51
.LBB36_49:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rsi
	movq	%rbp, %rdx
	retq
.LBB36_51:                              # Block address taken
                                        # Label of block must be emitted
	subq	$224, %rsp
	callq	.LBB36_43
.LBB36_44:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	movq	%rdi, %r12
	movzbl	%r8b, %r15d
	xorl	%eax, %eax
	xorl	%ecx, %ecx
.LBB36_2:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	orq	(%r14,%rax,8), %rcx
	incq	%rax
	cmpq	%rax, %r15
	jne	.LBB36_2
.LBB36_3:                               # Block address taken
                                        # Label of block must be emitted
	testq	%rcx, %rcx
	je	.LBB36_17
.LBB36_4:                               # Block address taken
                                        # Label of block must be emitted
	movsbl	%r15b, %ecx
	movl	%ecx, 12(%rsp)                  # 4-byte Spill
	leaq	32(%rsp), %rdi
	movq	%rbx, %rsi
	jmp	.LBB36_42
.LBB36_40:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	retq
.LBB36_42:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbx, %rdx
	movq	%r8, 16(%rsp)                   # 8-byte Spill
	callq	uECC_vli_mult
	leaq	128(%rsp), %rbp
	jmp	.LBB36_20
.LBB36_20:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbp, %rdi
	leaq	32(%rsp), %rsi
	callq	*192(%r13)
	movsbl	(%r13), %ecx
	leaq	32(%rsp), %rdi
	subq	$224, %rsp
	callq	.LBB36_46
.LBB36_47:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	callq	uECC_vli_mult
	jmp	.LBB36_21
.LBB36_21:                              # Block address taken
                                        # Label of block must be emitted
	leaq	96(%rsp), %rdi
	leaq	32(%rsp), %rsi
	callq	*192(%r13)
	movsbl	(%r13), %ecx
	leaq	32(%rsp), %rdi
	subq	$224, %rsp
	callq	.LBB36_49
.LBB36_50:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	jmp	.LBB36_96
.LBB36_94:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdi
	movq	%r14, %rsi
	retq
.LBB36_96:                              # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_mult
	jmp	.LBB36_22
.LBB36_22:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbp, %rdi
	leaq	32(%rsp), %rsi
	callq	*192(%r13)
	movsbl	(%r13), %ecx
	leaq	32(%rsp), %rbp
	subq	$224, %rsp
	callq	.LBB36_52
.LBB36_53:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	movq	%r14, %rdx
	jmp	.LBB36_23
.LBB36_23:                              # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_mult
	jmp	.LBB36_60
.LBB36_58:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdi
	movq	%rbp, %rsi
	retq
.LBB36_60:                              # Block address taken
                                        # Label of block must be emitted
	subq	$224, %rsp
	callq	.LBB36_55
.LBB36_56:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	callq	*192(%r13)
	movsbl	(%r13), %ecx
	leaq	32(%rsp), %rbp
	movq	%rbp, %rdi
	movq	%r14, %rsi
	jmp	.LBB36_24
.LBB36_24:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r14, %rdx
	callq	uECC_vli_mult
	subq	$224, %rsp
	callq	.LBB36_58
.LBB36_59:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	jmp	.LBB36_57
.LBB36_55:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	retq
.LBB36_57:                              # Block address taken
                                        # Label of block must be emitted
	callq	*192(%r13)
	leaq	8(%r13), %rbp
	movq	%r12, %rdi
	movq	%r12, %rsi
	jmp	.LBB36_25
.LBB36_25:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r14, %rdx
	movq	%rbp, %rcx
	movq	%r13, 24(%rsp)                  # 8-byte Spill
	movq	16(%rsp), %r13                  # 8-byte Reload
	movl	%r13d, %r8d
	callq	uECC_vli_modAdd
	subq	$224, %rsp
	callq	.LBB36_61
.LBB36_62:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	jmp	.LBB36_26
.LBB36_26:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r14, %rdx
	subq	$224, %rsp
	callq	.LBB36_64
.LBB36_65:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	callq	uECC_vli_modAdd
	movq	%r14, %rdi
	movq	%r12, %rsi
	subq	$224, %rsp
	callq	.LBB36_67
.LBB36_68:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	jmp	.LBB36_27
.LBB36_27:                              # Block address taken
                                        # Label of block must be emitted
	movl	12(%rsp), %r8d                  # 4-byte Reload
	callq	uECC_vli_modSub
	movq	24(%rsp), %r13                  # 8-byte Reload
	movsbl	(%r13), %ecx
	leaq	32(%rsp), %rdi
	subq	$224, %rsp
	callq	.LBB36_70
.LBB36_71:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	callq	uECC_vli_mult
	jmp	.LBB36_28
.LBB36_28:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r12, %rdi
	leaq	32(%rsp), %rsi
	callq	*192(%r13)
	subq	$224, %rsp
	callq	.LBB36_73
.LBB36_74:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	movq	%r12, %rdx
	movq	%rbp, %rcx
	movq	16(%rsp), %r8                   # 8-byte Reload
	jmp	.LBB36_29
.LBB36_29:                              # Block address taken
                                        # Label of block must be emitted
                                        # kill: def $r8d killed $r8d killed $r8
	callq	uECC_vli_modAdd
	subq	$224, %rsp
	callq	.LBB36_76
.LBB36_77:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	movq	%r14, %rdx
	movq	%rbp, %rcx
	jmp	.LBB36_78
.LBB36_76:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rdi
	movq	%r12, %rsi
	retq
.LBB36_78:                              # Block address taken
                                        # Label of block must be emitted
	movl	12(%rsp), %r8d                  # 4-byte Reload
	callq	uECC_vli_modAdd
	jmp	.LBB36_30
.LBB36_30:                              # Block address taken
                                        # Label of block must be emitted
	testb	$1, (%r12)
	jne	.LBB36_5
.LBB36_10:                              # Block address taken
                                        # Label of block must be emitted
	leaq	(%r12,%r15,8), %rax
	xorl	%ecx, %ecx
.LBB36_11:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	-8(%rax), %rdx
	subq	$224, %rsp
	callq	.LBB36_79
.LBB36_80:                              # Block address taken
                                        #   in Loop: Header=BB36_11 Depth=1
                                        # Label of block must be emitted
	addq	$224, %rsp
	orq	%rcx, %rsi
	jmp	.LBB36_69
.LBB36_67:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdx
	movq	%rbp, %rcx
	retq
.LBB36_69:                              # Block address taken
                                        #   in Loop: Header=BB36_11 Depth=1
                                        # Label of block must be emitted
	movq	%rsi, -8(%rax)
	leaq	-8(%rax), %rsi
	shlq	$63, %rdx
	movq	%rsi, %rax
	jmp	.LBB36_31
.LBB36_31:                              # Block address taken
                                        #   in Loop: Header=BB36_11 Depth=1
                                        # Label of block must be emitted
	movq	%rdx, %rcx
	cmpq	%r12, %rsi
	jmp	.LBB36_93
.LBB36_91:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rsi
	movq	%r12, %rdx
	retq
.LBB36_93:                              # Block address taken
                                        #   in Loop: Header=BB36_11 Depth=1
                                        # Label of block must be emitted
	ja	.LBB36_11
	jmp	.LBB36_12
.LBB36_5:                               # Block address taken
                                        # Label of block must be emitted
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB36_6:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%rax, %rdx
	subq	$224, %rsp
	callq	.LBB36_82
.LBB36_83:                              # Block address taken
                                        #   in Loop: Header=BB36_6 Depth=1
                                        # Label of block must be emitted
	addq	$224, %rsp
	addq	(%rbp,%rcx,8), %rdi
	xorl	%eax, %eax
	cmpq	%rsi, %rdi
	setb	%al
	cmoveq	%rdx, %rax
	jmp	.LBB36_32
.LBB36_32:                              # Block address taken
                                        #   in Loop: Header=BB36_6 Depth=1
                                        # Label of block must be emitted
	movq	%rdi, (%r12,%rcx,8)
	jmp	.LBB36_75
.LBB36_73:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdi
	movq	%r12, %rsi
	retq
.LBB36_75:                              # Block address taken
                                        #   in Loop: Header=BB36_6 Depth=1
                                        # Label of block must be emitted
	incq	%rcx
	jmp	.LBB36_63
.LBB36_61:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdi
	movq	%r14, %rsi
	retq
.LBB36_63:                              # Block address taken
                                        #   in Loop: Header=BB36_6 Depth=1
                                        # Label of block must be emitted
	cmpq	%rcx, %r15
	jne	.LBB36_6
.LBB36_7:                               # Block address taken
                                        # Label of block must be emitted
	leaq	(%r12,%r15,8), %rcx
	xorl	%edx, %edx
	movq	16(%rsp), %r8                   # 8-byte Reload
.LBB36_8:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	-8(%rcx), %rsi
	subq	$224, %rsp
	callq	.LBB36_85
.LBB36_86:                              # Block address taken
                                        #   in Loop: Header=BB36_8 Depth=1
                                        # Label of block must be emitted
	addq	$224, %rsp
	orq	%rdx, %rdi
	movq	%rdi, -8(%rcx)
	subq	$224, %rsp
	callq	.LBB36_88
.LBB36_89:                              # Block address taken
                                        #   in Loop: Header=BB36_8 Depth=1
                                        # Label of block must be emitted
	addq	$224, %rsp
	movq	%rdi, %rcx
	jmp	.LBB36_33
.LBB36_33:                              # Block address taken
                                        #   in Loop: Header=BB36_8 Depth=1
                                        # Label of block must be emitted
	movq	%rsi, %rdx
	cmpq	%r12, %rdi
	ja	.LBB36_8
.LBB36_9:                               # Block address taken
                                        # Label of block must be emitted
	shlq	$63, %rax
	jmp	.LBB36_45
.LBB36_43:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rdx, %r14
	movq	%rsi, %rbx
	retq
.LBB36_45:                              # Block address taken
                                        # Label of block must be emitted
	orq	%rax, -8(%r12,%r8,8)
.LBB36_12:                              # Block address taken
                                        # Label of block must be emitted
	movq	24(%rsp), %r13                  # 8-byte Reload
	movsbl	(%r13), %ecx
	leaq	32(%rsp), %rdi
	subq	$224, %rsp
	callq	.LBB36_91
.LBB36_92:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	callq	uECC_vli_mult
	movq	%r14, %rdi
	leaq	32(%rsp), %rsi
	jmp	.LBB36_34
.LBB36_34:                              # Block address taken
                                        # Label of block must be emitted
	callq	*192(%r13)
	leaq	96(%rsp), %rdx
	subq	$224, %rsp
	callq	.LBB36_94
.LBB36_95:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	movq	%rbp, %rcx
	movq	16(%rsp), %r13                  # 8-byte Reload
	movl	%r13d, %r8d
	callq	uECC_vli_modSub
	jmp	.LBB36_35
.LBB36_35:                              # Block address taken
                                        # Label of block must be emitted
	movsbl	%r15b, %r8d
	movl	%r8d, 12(%rsp)                  # 4-byte Spill
	subq	$224, %rsp
	callq	.LBB36_97
.LBB36_98:                              # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	leaq	96(%rsp), %rdx
	movq	%rbp, %rcx
	callq	uECC_vli_modSub
	leaq	96(%rsp), %rdi
	jmp	.LBB36_36
.LBB36_36:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rdi, %rsi
	subq	$224, %rsp
	callq	.LBB36_100
.LBB36_101:                             # Block address taken
                                        # Label of block must be emitted
	addq	$224, %rsp
	movl	%r13d, %r8d
	callq	uECC_vli_modSub
	movq	24(%rsp), %r13                  # 8-byte Reload
	movsbl	(%r13), %ecx
	leaq	32(%rsp), %rdi
	jmp	.LBB36_37
.LBB36_37:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r12, %rsi
	leaq	96(%rsp), %rdx
	callq	uECC_vli_mult
	movq	%r12, %rdi
	leaq	32(%rsp), %rsi
	callq	*192(%r13)
	leaq	128(%rsp), %rdi
	movq	%r12, %rsi
	jmp	.LBB36_38
.LBB36_38:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	jmp	.LBB36_84
.LBB36_82:                              # Block address taken
                                        #   in Loop: Header=BB36_6 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	(%r12,%rcx,8), %rsi
	leaq	(%rsi,%rax), %rdi
	retq
.LBB36_84:                              # Block address taken
                                        # Label of block must be emitted
	movl	12(%rsp), %r8d                  # 4-byte Reload
	callq	uECC_vli_modSub
	xorl	%eax, %eax
.LBB36_13:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	(%r14,%rax,8), %rcx
	movq	%rcx, (%r12,%rax,8)
	jmp	.LBB36_72
.LBB36_70:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rsi
	movq	%r14, %rdx
	retq
.LBB36_72:                              # Block address taken
                                        #   in Loop: Header=BB36_13 Depth=1
                                        # Label of block must be emitted
	incq	%rax
	jmp	.LBB36_81
.LBB36_79:                              # Block address taken
                                        #   in Loop: Header=BB36_11 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rdx, %rsi
	shrq	%rsi
	retq
.LBB36_81:                              # Block address taken
                                        #   in Loop: Header=BB36_13 Depth=1
                                        # Label of block must be emitted
	cmpq	%rax, %r15
	jne	.LBB36_13
.LBB36_14:                              # Block address taken
                                        # Label of block must be emitted
	xorl	%eax, %eax
.LBB36_15:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	(%rbx,%rax,8), %rcx
	movq	%rcx, (%r14,%rax,8)
	jmp	.LBB36_87
.LBB36_85:                              # Block address taken
                                        #   in Loop: Header=BB36_8 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rsi, %rdi
	shrq	%rdi
	retq
.LBB36_87:                              # Block address taken
                                        #   in Loop: Header=BB36_15 Depth=1
                                        # Label of block must be emitted
	incq	%rax
	cmpq	%rax, %r15
	jne	.LBB36_15
.LBB36_16:                              # Block address taken
                                        # Label of block must be emitted
	shlq	$3, %r15
	leaq	128(%rsp), %rsi
	jmp	.LBB36_48
.LBB36_46:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rsi
	movq	%rbp, %rdx
	retq
.LBB36_48:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbx, %rdi
	movq	%r15, %rdx
	callq	memcpy@PLT
.LBB36_17:                              # Block address taken
                                        # Label of block must be emitted
	addq	$168, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	jmp	.LBB36_90
.LBB36_88:                              # Block address taken
                                        #   in Loop: Header=BB36_8 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leaq	-8(%rcx), %rdi
	shlq	$63, %rsi
	retq
.LBB36_90:                              # Block address taken
                                        # Label of block must be emitted
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	jmp	.LBB36_39
.LBB36_39:                              # Block address taken
                                        # Label of block must be emitted
	popq	%r14
	.cfi_def_cfa_offset 24
	jmp	.LBB36_66
.LBB36_64:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rcx
	movl	%r13d, %r8d
	retq
.LBB36_66:                              # Block address taken
                                        # Label of block must be emitted
	popq	%r15
	jmp	.LBB36_54
.LBB36_52:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	retq
.LBB36_54:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	popq	%rbp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	retq
.Lfunc_end36:
	.size	double_jacobian_default, .Lfunc_end36-double_jacobian_default
	.cfi_endproc
                                        # -- End function
	.type	mod_sqrt_default,@function      # -- Begin function mod_sqrt_default
mod_sqrt_default:                       # @mod_sqrt_default
	.cfi_startproc
# %bb.0:                                # Block address taken
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushq	%rbp
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	jmp	.LBB37_11
.LBB37_11:                              # Block address taken
                                        # Label of block must be emitted
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	jmp	.LBB37_12
.LBB37_12:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_offset %r13, -40
	subq	$192, %rsp
	callq	.LBB37_17
.LBB37_18:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	.cfi_offset %rbp, -16
	movq	%rsi, %r15
	subq	$192, %rsp
	callq	.LBB37_20
.LBB37_21:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	movaps	%xmm0, 16(%rsp)
	jmp	.LBB37_13
.LBB37_13:                              # Block address taken
                                        # Label of block must be emitted
	movaps	.L__const.mod_sqrt_secp224r1_rp.e0(%rip), %xmm1
	movaps	%xmm1, (%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm1, 32(%rsp)
	movzbl	(%rsi), %r14d
	testb	%r14b, %r14b
	jle	.LBB37_3
.LBB37_1:                               # Block address taken
                                        # Label of block must be emitted
	xorl	%eax, %eax
	jmp	.LBB37_28
.LBB37_26:                              # Block address taken
                                        #   in Loop: Header=BB37_5 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rdi
	movq	%r13, %rsi
	retq
.LBB37_28:                              # Block address taken
                                        # Label of block must be emitted
	xorl	%ecx, %ecx
.LBB37_2:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	8(%r15,%rax,8), %rdx
	leaq	(%rdx,%rcx), %rsi
	addq	(%rsp,%rax,8), %rsi
	xorl	%edi, %edi
	jmp	.LBB37_22
.LBB37_20:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rdi, %rbx
	movaps	.L__const.mod_sqrt_secp224r1_rp.e0+16(%rip), %xmm0
	retq
.LBB37_22:                              # Block address taken
                                        #   in Loop: Header=BB37_2 Depth=1
                                        # Label of block must be emitted
	cmpq	%rdx, %rsi
	setb	%dil
	jmp	.LBB37_31
.LBB37_29:                              # Block address taken
                                        #   in Loop: Header=BB37_5 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rdi
	movq	%r13, %rsi
	retq
.LBB37_31:                              # Block address taken
                                        #   in Loop: Header=BB37_2 Depth=1
                                        # Label of block must be emitted
	cmovneq	%rdi, %rcx
	jmp	.LBB37_34
.LBB37_32:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rdi
	movq	%r14, %rdx
	retq
.LBB37_34:                              # Block address taken
                                        #   in Loop: Header=BB37_2 Depth=1
                                        # Label of block must be emitted
	movq	%rsi, (%rsp,%rax,8)
	jmp	.LBB37_14
.LBB37_14:                              # Block address taken
                                        #   in Loop: Header=BB37_2 Depth=1
                                        # Label of block must be emitted
	incq	%rax
	cmpq	%rax, %r14
	jne	.LBB37_2
.LBB37_3:                               # Block address taken
                                        # Label of block must be emitted
	movsbl	%r14b, %esi
	movq	%rsp, %rdi
	callq	uECC_vli_numBits
	subq	$192, %rsp
	callq	.LBB37_23
.LBB37_24:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	cmpw	$2, %ax
	jl	.LBB37_8
.LBB37_4:                               # Block address taken
                                        # Label of block must be emitted
	movzwl	%ax, %ebp
	leaq	64(%rsp), %r12
	leaq	32(%rsp), %r13
.LBB37_5:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movsbl	(%r15), %ecx
	subq	$192, %rsp
	callq	.LBB37_26
.LBB37_27:                              # Block address taken
                                        #   in Loop: Header=BB37_5 Depth=1
                                        # Label of block must be emitted
	addq	$192, %rsp
	movq	%r13, %rdx
	jmp	.LBB37_19
.LBB37_17:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	retq
.LBB37_19:                              # Block address taken
                                        #   in Loop: Header=BB37_5 Depth=1
                                        # Label of block must be emitted
	callq	uECC_vli_mult
	movq	%r13, %rdi
	movq	%r12, %rsi
	callq	*192(%r15)
	jmp	.LBB37_15
.LBB37_15:                              # Block address taken
                                        #   in Loop: Header=BB37_5 Depth=1
                                        # Label of block must be emitted
	movl	%ebp, %eax
	shrl	$6, %eax
	movq	(%rsp,%rax,8), %rax
	btq	%rbp, %rax
	jae	.LBB37_7
.LBB37_6:                               # Block address taken
                                        #   in Loop: Header=BB37_5 Depth=1
                                        # Label of block must be emitted
	movsbl	(%r15), %ecx
	subq	$192, %rsp
	callq	.LBB37_29
.LBB37_30:                              # Block address taken
                                        #   in Loop: Header=BB37_5 Depth=1
                                        # Label of block must be emitted
	addq	$192, %rsp
	movq	%rbx, %rdx
	callq	uECC_vli_mult
	movq	%r13, %rdi
	movq	%r12, %rsi
	callq	*192(%r15)
.LBB37_7:                               # Block address taken
                                        #   in Loop: Header=BB37_5 Depth=1
                                        # Label of block must be emitted
	decl	%ebp
	cmpw	$1, %bp
	jg	.LBB37_5
.LBB37_8:                               # Block address taken
                                        # Label of block must be emitted
	testb	%r14b, %r14b
	jle	.LBB37_10
.LBB37_9:                               # Block address taken
                                        # Label of block must be emitted
	shlq	$3, %r14
	leaq	32(%rsp), %rsi
	subq	$192, %rsp
	callq	.LBB37_32
.LBB37_33:                              # Block address taken
                                        # Label of block must be emitted
	addq	$192, %rsp
	callq	memcpy@PLT
.LBB37_10:                              # Block address taken
                                        # Label of block must be emitted
	addq	$136, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	jmp	.LBB37_16
.LBB37_16:                              # Block address taken
                                        # Label of block must be emitted
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	jmp	.LBB37_25
.LBB37_23:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
                                        # kill: def $ax killed $ax def $eax
	decl	%eax
	retq
.LBB37_25:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	popq	%rbp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	retq
.Lfunc_end37:
	.size	mod_sqrt_default, .Lfunc_end37-mod_sqrt_default
	.cfi_endproc
                                        # -- End function
	.type	x_side_default,@function        # -- Begin function x_side_default
x_side_default:                         # @x_side_default
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %rbx
	movq	%rsi, %r15
	movq	%rdi, %r14
	movsbl	(%rdx), %ebp
	movq	%rsp, %r12
	movq	%r12, %rdi
	movq	%rsi, %rdx
	movl	%ebp, %ecx
	callq	uECC_vli_mult
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	*192(%rbx)
	leaq	8(%rbx), %r12
	leaq	.L__const.x_side_default._3(%rip), %rdx
	movq	%r14, %rdi
	movq	%r14, %rsi
	movq	%r12, %rcx
	movl	%ebp, %r8d
	callq	uECC_vli_modSub
	movsbl	(%rbx), %ecx
	movq	%rsp, %r13
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	callq	uECC_vli_mult
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	*192(%rbx)
	addq	$136, %rbx
	movq	%r14, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movl	%ebp, %r8d
	callq	uECC_vli_modAdd
	addq	$72, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end38:
	.size	x_side_default, .Lfunc_end38-x_side_default
	.cfi_endproc
                                        # -- End function
	.type	vli_mmod_fast_secp160r1,@function # -- Begin function vli_mmod_fast_secp160r1
vli_mmod_fast_secp160r1:                # @vli_mmod_fast_secp160r1
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	addq	$16, %rsi
	xorps	%xmm0, %xmm0
	leaq	16(%rsp), %r15
	movaps	%xmm0, 16(%r15)
	movaps	%xmm0, (%r15)
	movaps	%xmm0, -16(%r15)
	movq	%rsp, %r12
	movq	%r12, %rdi
	callq	omega_mult_secp160r1
	movl	$0, 20(%r14)
	movq	16(%r12), %rax
	movl	%eax, %ecx
	movq	%rcx, 16(%r12)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.LBB39_1:                               # =>This Inner Loop Header: Depth=1
	movq	(%r14,%rcx,8), %rsi
	leaq	(%rsi,%rdx), %rdi
	addq	(%rsp,%rcx,8), %rdi
	xorl	%r8d, %r8d
	cmpq	%rsi, %rdi
	setb	%r8b
	cmovneq	%r8, %rdx
	movq	%rdi, (%rbx,%rcx,8)
	incq	%rcx
	cmpq	$3, %rcx
	jne	.LBB39_1
# %bb.2:
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14)
	movq	$0, 16(%r14)
	movq	%rax, 16(%rsp)
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	omega_mult_secp160r1
	xorl	%eax, %eax
	xorl	%ecx, %ecx
.LBB39_3:                               # =>This Inner Loop Header: Depth=1
	movq	(%rbx,%rax,8), %rdx
	leaq	(%rdx,%rcx), %rsi
	addq	(%r14,%rax,8), %rsi
	xorl	%edi, %edi
	cmpq	%rdx, %rsi
	setb	%dil
	cmovneq	%rdi, %rcx
	movq	%rsi, (%rbx,%rax,8)
	incq	%rax
	cmpq	$3, %rax
	jne	.LBB39_3
# %bb.4:
	movl	$3, %ecx
	leaq	curve_secp160r1(%rip), %rax
.LBB39_5:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB39_8 Depth 2
	testq	%rcx, %rcx
	jle	.LBB39_11
# %bb.6:                                #   in Loop: Header=BB39_5 Depth=1
	decq	%rcx
	movzbl	%cl, %edx
	shlq	$3, %rdx
	movq	8(%rdx,%rax), %rsi
	cmpq	%rsi, (%rbx,%rdx)
	jbe	.LBB39_10
# %bb.7:                                #   in Loop: Header=BB39_5 Depth=1
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.LBB39_8:                               #   Parent Loop BB39_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%rax,%rcx,8), %rsi
	addq	%rdx, %rsi
	xorl	%edi, %edi
	subq	%rsi, (%rbx,%rcx,8)
	setb	%dil
	testq	%rsi, %rsi
	cmovneq	%rdi, %rdx
	incq	%rcx
	cmpq	$3, %rcx
	jne	.LBB39_8
# %bb.9:                                #   in Loop: Header=BB39_5 Depth=1
	movl	$3, %ecx
	jmp	.LBB39_5
.LBB39_10:                              #   in Loop: Header=BB39_5 Depth=1
	jae	.LBB39_5
.LBB39_11:
	addq	$56, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end39:
	.size	vli_mmod_fast_secp160r1, .Lfunc_end39-vli_mmod_fast_secp160r1
	.cfi_endproc
                                        # -- End function
	.type	uECC_vli_modAdd,@function       # -- Begin function uECC_vli_modAdd
uECC_vli_modAdd:                        # @uECC_vli_modAdd
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
                                        # kill: def $r8d killed $r8d def $r8
	movzbl	%r8b, %eax
	testb	%r8b, %r8b
	jle	.LBB40_4
# %bb.1:
	xorl	%r9d, %r9d
	xorl	%r10d, %r10d
.LBB40_2:                               # =>This Inner Loop Header: Depth=1
	movq	%r10, %r11
	movq	(%rsi,%r9,8), %rbx
	leaq	(%rbx,%r10), %r14
	addq	(%rdx,%r9,8), %r14
	xorl	%r10d, %r10d
	cmpq	%rbx, %r14
	setb	%r10b
	cmoveq	%r11, %r10
	movq	%r14, (%rdi,%r9,8)
	incq	%r9
	cmpq	%r9, %rax
	jne	.LBB40_2
# %bb.3:
	testq	%r10, %r10
	jne	.LBB40_8
.LBB40_4:
	leal	-1(%r8), %edx
.LBB40_5:                               # =>This Inner Loop Header: Depth=1
	testb	%dl, %dl
	js	.LBB40_8
# %bb.6:                                #   in Loop: Header=BB40_5 Depth=1
	movzbl	%dl, %r9d
	movq	(%rcx,%r9,8), %rsi
	movq	(%rdi,%r9,8), %r9
	cmpq	%r9, %rsi
	ja	.LBB40_11
# %bb.7:                                #   in Loop: Header=BB40_5 Depth=1
	decb	%dl
	cmpq	%r9, %rsi
	jae	.LBB40_5
.LBB40_8:
	testb	%r8b, %r8b
	jle	.LBB40_11
# %bb.9:
	xorl	%edx, %edx
	xorl	%esi, %esi
.LBB40_10:                              # =>This Inner Loop Header: Depth=1
	movq	(%rcx,%rdx,8), %r8
	addq	%rsi, %r8
	xorl	%r9d, %r9d
	subq	%r8, (%rdi,%rdx,8)
	setb	%r9b
	testq	%r8, %r8
	cmovneq	%r9, %rsi
	incq	%rdx
	cmpq	%rdx, %rax
	jne	.LBB40_10
.LBB40_11:
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end40:
	.size	uECC_vli_modAdd, .Lfunc_end40-uECC_vli_modAdd
	.cfi_endproc
                                        # -- End function
	.type	omega_mult_secp160r1,@function  # -- Begin function omega_mult_secp160r1
omega_mult_secp160r1:                   # @omega_mult_secp160r1
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	xorl	%ecx, %ecx
.LBB41_1:                               # =>This Inner Loop Header: Depth=1
	movq	(%rsi,%rax,8), %rdx
	movq	8(%rsi,%rax,8), %r8
	shldq	$32, %rdx, %r8
	movq	%r8, %rdx
	shlq	$31, %rdx
	movl	%ecx, %r9d
	addq	%r8, %r9
	addq	%rdx, %r9
	movq	%r9, (%rdi,%rax,8)
	incq	%rax
	movq	%r8, %rdx
	shrq	$33, %rdx
	movb	$1, %r10b
	cmpq	%r8, %r9
	jb	.LBB41_3
# %bb.2:                                #   in Loop: Header=BB41_1 Depth=1
	testl	%ecx, %ecx
	setne	%cl
	cmpq	%r8, %r9
	sete	%r10b
	andb	%cl, %r10b
.LBB41_3:                               #   in Loop: Header=BB41_1 Depth=1
	movzbl	%r10b, %ecx
	addq	%rcx, %rdx
	movl	%edx, %ecx
	cmpq	$3, %rax
	jne	.LBB41_1
# %bb.4:
	movq	%rdx, 24(%rdi)
	retq
.Lfunc_end41:
	.size	omega_mult_secp160r1, .Lfunc_end41-omega_mult_secp160r1
	.cfi_endproc
                                        # -- End function
	.type	vli_mmod_fast_secp192r1,@function # -- Begin function vli_mmod_fast_secp192r1
vli_mmod_fast_secp192r1:                # @vli_mmod_fast_secp192r1
	.cfi_startproc
# %bb.0:                                # Block address taken
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushq	%rbp
	xorl	%eax, %eax
.LBB42_1:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	(%rsi,%rax,8), %rcx
	subq	$32, %rsp
	callq	.LBB42_22
.LBB42_23:                              # Block address taken
                                        #   in Loop: Header=BB42_1 Depth=1
                                        # Label of block must be emitted
	addq	$32, %rsp
	cmpq	$3, %rax
	jne	.LBB42_1
.LBB42_2:                               # Block address taken
                                        # Label of block must be emitted
	leaq	24(%rsi), %rax
	movq	40(%rsi), %rcx
	movq	%rcx, -8(%rsp)
	movups	24(%rsi), %xmm0
	movaps	%xmm0, -24(%rsp)
	xorl	%edx, %edx
	xorl	%ecx, %ecx
.LBB42_3:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%rcx, %r8
	jmp	.LBB42_36
.LBB42_34:                              # Block address taken
                                        #   in Loop: Header=BB42_15 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	8(%rcx,%rdx,8), %r9
	addq	%rsi, %r9
	retq
.LBB42_36:                              # Block address taken
                                        #   in Loop: Header=BB42_3 Depth=1
                                        # Label of block must be emitted
	subq	$32, %rsp
	callq	.LBB42_25
.LBB42_26:                              # Block address taken
                                        #   in Loop: Header=BB42_3 Depth=1
                                        # Label of block must be emitted
	addq	$32, %rsp
	addq	-24(%rsp,%rdx,8), %r10
	xorl	%ecx, %ecx
	cmpq	%r9, %r10
	setb	%cl
	cmoveq	%r8, %rcx
	jmp	.LBB42_18
.LBB42_18:                              # Block address taken
                                        #   in Loop: Header=BB42_3 Depth=1
                                        # Label of block must be emitted
	movq	%r10, (%rdi,%rdx,8)
	jmp	.LBB42_33
.LBB42_31:                              # Block address taken
                                        #   in Loop: Header=BB42_7 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	(%rdi,%rdx,8), %r9
	leaq	(%r9,%rsi), %r10
	retq
.LBB42_33:                              # Block address taken
                                        #   in Loop: Header=BB42_3 Depth=1
                                        # Label of block must be emitted
	incq	%rdx
	jmp	.LBB42_30
.LBB42_28:                              # Block address taken
                                        #   in Loop: Header=BB42_5 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	(%rdi,%rdx,8), %r9
	leaq	(%r9,%rax), %r10
	retq
.LBB42_30:                              # Block address taken
                                        #   in Loop: Header=BB42_3 Depth=1
                                        # Label of block must be emitted
	cmpq	$3, %rdx
	jne	.LBB42_3
.LBB42_4:                               # Block address taken
                                        # Label of block must be emitted
	movq	$0, -24(%rsp)
	movups	(%rax), %xmm0
	jmp	.LBB42_27
.LBB42_25:                              # Block address taken
                                        #   in Loop: Header=BB42_3 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	(%rdi,%rdx,8), %r9
	leaq	(%r9,%rcx), %r10
	retq
.LBB42_27:                              # Block address taken
                                        # Label of block must be emitted
	movups	%xmm0, -16(%rsp)
	xorl	%edx, %edx
	xorl	%eax, %eax
.LBB42_5:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%rax, %r8
	subq	$32, %rsp
	callq	.LBB42_28
.LBB42_29:                              # Block address taken
                                        #   in Loop: Header=BB42_5 Depth=1
                                        # Label of block must be emitted
	addq	$32, %rsp
	addq	-24(%rsp,%rdx,8), %r10
	jmp	.LBB42_24
.LBB42_22:                              # Block address taken
                                        #   in Loop: Header=BB42_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rcx, (%rdi,%rax,8)
	incq	%rax
	retq
.LBB42_24:                              # Block address taken
                                        #   in Loop: Header=BB42_5 Depth=1
                                        # Label of block must be emitted
	xorl	%eax, %eax
	cmpq	%r9, %r10
	setb	%al
	cmoveq	%r8, %rax
	jmp	.LBB42_19
.LBB42_19:                              # Block address taken
                                        #   in Loop: Header=BB42_5 Depth=1
                                        # Label of block must be emitted
	movq	%r10, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$3, %rdx
	jne	.LBB42_5
.LBB42_6:                               # Block address taken
                                        # Label of block must be emitted
	movq	40(%rsi), %rdx
	movq	%rdx, -16(%rsp)
	movq	%rdx, -24(%rsp)
	movq	$0, -8(%rsp)
	xorl	%edx, %edx
	xorl	%esi, %esi
.LBB42_7:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%rsi, %r8
	subq	$32, %rsp
	callq	.LBB42_31
.LBB42_32:                              # Block address taken
                                        #   in Loop: Header=BB42_7 Depth=1
                                        # Label of block must be emitted
	addq	$32, %rsp
	addq	-24(%rsp,%rdx,8), %r10
	xorl	%esi, %esi
	cmpq	%r9, %r10
	setb	%sil
	cmoveq	%r8, %rsi
	jmp	.LBB42_20
.LBB42_20:                              # Block address taken
                                        #   in Loop: Header=BB42_7 Depth=1
                                        # Label of block must be emitted
	movq	%r10, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$3, %rdx
	jne	.LBB42_7
.LBB42_8:                               # Block address taken
                                        # Label of block must be emitted
	addq	%rcx, %rax
	addq	%rsi, %rax
	leaq	curve_secp192r1(%rip), %rcx
.LBB42_9:                               # Block address taken
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB42_11 Depth 2
                                        #     Child Loop BB42_15 Depth 2
                                        # Label of block must be emitted
	testl	%eax, %eax
	je	.LBB42_10
.LBB42_14:                              # Block address taken
                                        #   in Loop: Header=BB42_9 Depth=1
                                        # Label of block must be emitted
	xorl	%edx, %edx
	xorl	%esi, %esi
.LBB42_15:                              # Block address taken
                                        #   Parent Loop BB42_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	%rsi, %r8
	subq	$32, %rsp
	callq	.LBB42_34
.LBB42_35:                              # Block address taken
                                        #   in Loop: Header=BB42_15 Depth=2
                                        # Label of block must be emitted
	addq	$32, %rsp
	xorl	%esi, %esi
	subq	%r9, (%rdi,%rdx,8)
	jmp	.LBB42_39
.LBB42_37:                              # Block address taken
                                        #   in Loop: Header=BB42_11 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	shlq	$3, %rsi
	movq	(%rdi,%rsi), %r8
	retq
.LBB42_39:                              # Block address taken
                                        #   in Loop: Header=BB42_15 Depth=2
                                        # Label of block must be emitted
	setb	%sil
	testq	%r9, %r9
	cmoveq	%r8, %rsi
	jmp	.LBB42_21
.LBB42_21:                              # Block address taken
                                        #   in Loop: Header=BB42_15 Depth=2
                                        # Label of block must be emitted
	incq	%rdx
	cmpq	$3, %rdx
	jne	.LBB42_15
.LBB42_16:                              # Block address taken
                                        #   in Loop: Header=BB42_9 Depth=1
                                        # Label of block must be emitted
	cltq
	subq	%rsi, %rax
	jmp	.LBB42_9
.LBB42_10:                              # Block address taken
                                        #   in Loop: Header=BB42_9 Depth=1
                                        # Label of block must be emitted
	movl	$3, %edx
.LBB42_11:                              # Block address taken
                                        #   Parent Loop BB42_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	%rdx, %rsi
	decq	%rdx
	testq	%rsi, %rsi
	jle	.LBB42_14
.LBB42_12:                              # Block address taken
                                        #   in Loop: Header=BB42_11 Depth=2
                                        # Label of block must be emitted
	movzbl	%dl, %esi
	subq	$32, %rsp
	callq	.LBB42_37
.LBB42_38:                              # Block address taken
                                        #   in Loop: Header=BB42_11 Depth=2
                                        # Label of block must be emitted
	addq	$32, %rsp
	cmpq	%r8, 8(%rsi,%rcx)
	ja	.LBB42_17
.LBB42_13:                              # Block address taken
                                        #   in Loop: Header=BB42_11 Depth=2
                                        # Label of block must be emitted
	jae	.LBB42_11
	jmp	.LBB42_14
.LBB42_17:                              # Block address taken
                                        # Label of block must be emitted
	popq	%rbp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	retq
.Lfunc_end42:
	.size	vli_mmod_fast_secp192r1, .Lfunc_end42-vli_mmod_fast_secp192r1
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function mod_sqrt_secp224r1
.LCPI43_0:
	.zero	16
	.text
	.type	mod_sqrt_secp224r1,@function
mod_sqrt_secp224r1:                     # @mod_sqrt_secp224r1
	.cfi_startproc
# %bb.0:                                # Block address taken
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushq	%rbp
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	jmp	.LBB43_8
.LBB43_8:                               # Block address taken
                                        # Label of block must be emitted
	pushq	%r12
	.cfi_def_cfa_offset 48
	jmp	.LBB43_97
.LBB43_95:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rdx
	movl	$4, %ecx
	retq
.LBB43_97:                              # Block address taken
                                        # Label of block must be emitted
	pushq	%rbx
	.cfi_def_cfa_offset 56
	jmp	.LBB43_85
.LBB43_83:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rcx
	movl	$4, %r8d
	retq
.LBB43_85:                              # Block address taken
                                        # Label of block must be emitted
	subq	$344, %rsp                      # imm = 0x158
	.cfi_def_cfa_offset 400
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	jmp	.LBB43_9
.LBB43_9:                               # Block address taken
                                        # Label of block must be emitted
	.cfi_offset %r13, -40
	jmp	.LBB43_70
.LBB43_68:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rdx
	movl	$4, %ecx
	retq
.LBB43_70:                              # Block address taken
                                        # Label of block must be emitted
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_35
.LBB43_36:                              # Block address taken
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	.cfi_offset %rbp, -16
	movq	%rdi, %rdx
	jmp	.LBB43_67
.LBB43_65:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r15, %rdi
	movq	%r12, %rsi
	retq
.LBB43_67:                              # Block address taken
                                        # Label of block must be emitted
	movaps	.L__const.mod_sqrt_secp224r1_rp.e0+16(%rip), %xmm0
	leaq	144(%rsp), %rax
	movaps	%xmm0, 16(%rax)
	jmp	.LBB43_10
.LBB43_10:                              # Block address taken
                                        # Label of block must be emitted
	movaps	.L__const.mod_sqrt_secp224r1_rp.e0(%rip), %xmm0
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_38
.LBB43_39:                              # Block address taken
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	movups	16(%rdi), %xmm1
	leaq	16(%rsp), %rax
	movaps	%xmm1, 16(%rax)
	movdqa	%xmm0, (%rax)
	leaq	curve_secp224r1+8(%rip), %rcx
	jmp	.LBB43_11
.LBB43_11:                              # Block address taken
                                        # Label of block must be emitted
	leaq	208(%rsp), %rdi
	movq	%rcx, %rsi
	movq	%rdx, (%rsp)                    # 8-byte Spill
	jmp	.LBB43_49
.LBB43_47:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rdi
	movq	%rbp, %rsi
	retq
.LBB43_49:                              # Block address taken
                                        # Label of block must be emitted
	movl	$4, %r8d
	jmp	.LBB43_76
.LBB43_74:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rdi
	movq	%rbp, %rsi
	retq
.LBB43_76:                              # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_modSub
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_41
.LBB43_42:                              # Block address taken
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	leaq	48(%rsp), %r13
	jmp	.LBB43_12
.LBB43_12:                              # Block address taken
                                        # Label of block must be emitted
	leaq	80(%rsp), %rbp
	leaq	112(%rsp), %r14
.LBB43_1:                               # Block address taken
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB43_2 Depth 2
                                        # Label of block must be emitted
	movl	%eax, 12(%rsp)                  # 4-byte Spill
	movaps	16(%rsp), %xmm0
	movaps	32(%rsp), %xmm1
	movaps	%xmm1, 64(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	144(%rsp), %xmm0
	movaps	160(%rsp), %xmm1
	movaps	%xmm1, 96(%rsp)
	jmp	.LBB43_13
.LBB43_13:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movaps	%xmm0, 80(%rsp)
	movdqa	208(%rsp), %xmm0
	jmp	.LBB43_43
.LBB43_41:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movb	$1, %cl
	xorl	%eax, %eax
	retq
.LBB43_43:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movaps	224(%rsp), %xmm1
	movaps	%xmm1, 128(%rsp)
	jmp	.LBB43_40
.LBB43_38:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movaps	%xmm0, (%rax)
	movdqu	(%rdi), %xmm0
	retq
.LBB43_40:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movdqa	%xmm0, 112(%rsp)
	movsbl	%cl, %ecx
	movl	%ecx, 8(%rsp)                   # 4-byte Spill
	movl	%ecx, %ebx
.LBB43_2:                               # Block address taken
                                        #   Parent Loop BB43_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	%r13, %rdi
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_44
.LBB43_45:                              # Block address taken
                                        #   in Loop: Header=BB43_2 Depth=2
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	movq	%r13, %rcx
	movq	%rbp, %r8
	movq	%r14, %r9
	callq	mod_sqrt_secp224r1_rs
	decw	%bx
	jmp	.LBB43_14
.LBB43_14:                              # Block address taken
                                        #   in Loop: Header=BB43_2 Depth=2
                                        # Label of block must be emitted
	jne	.LBB43_2
.LBB43_3:                               # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	leaq	272(%rsp), %r12
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_47
.LBB43_48:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	leaq	144(%rsp), %rdx
	movl	$4, %ecx
	callq	uECC_vli_mult
	leaq	240(%rsp), %r15
	movq	%r15, %rdi
	jmp	.LBB43_15
.LBB43_15:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movq	%r12, %rsi
	callq	vli_mmod_fast_secp224r1
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_50
.LBB43_51:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	jmp	.LBB43_46
.LBB43_44:                              # Block address taken
                                        #   in Loop: Header=BB43_2 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rsi
	movq	%r14, %rdx
	retq
.LBB43_46:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movq	(%rsp), %rdx                    # 8-byte Reload
	movl	$4, %ecx
	jmp	.LBB43_52
.LBB43_50:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r12, %rdi
	movq	%r15, %rsi
	retq
.LBB43_52:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	callq	uECC_vli_mult
	jmp	.LBB43_55
.LBB43_53:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r15, %rdi
	leaq	curve_secp224r1+8(%rip), %rcx
	retq
.LBB43_55:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movq	%r15, %rdi
	jmp	.LBB43_16
.LBB43_16:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movq	%r12, %rsi
	callq	vli_mmod_fast_secp224r1
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_53
.LBB43_54:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	movq	%rcx, %rsi
	movq	%r15, %rdx
	movl	$4, %r8d
	callq	uECC_vli_modSub
	jmp	.LBB43_17
.LBB43_17:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movq	%r12, %rdi
	movq	%r13, %rsi
	leaq	16(%rsp), %rdx
	movl	$4, %ecx
	callq	uECC_vli_mult
	leaq	176(%rsp), %rbx
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_56
.LBB43_57:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	jmp	.LBB43_18
.LBB43_18:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	callq	vli_mmod_fast_secp224r1
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_59
.LBB43_60:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	movq	%r15, %rdx
	leaq	curve_secp224r1+8(%rip), %rbx
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_62
.LBB43_63:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	callq	uECC_vli_modAdd
	jmp	.LBB43_19
.LBB43_19:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movq	%r12, %rdi
	movq	%r13, %rsi
	leaq	144(%rsp), %rdx
	movl	$4, %ecx
	callq	uECC_vli_mult
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_65
.LBB43_66:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	callq	vli_mmod_fast_secp224r1
	jmp	.LBB43_20
.LBB43_20:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movq	%r12, %rdi
	leaq	16(%rsp), %rsi
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_68
.LBB43_69:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	callq	uECC_vli_mult
	movq	%rbp, %rdi
	movq	%r12, %rsi
	callq	vli_mmod_fast_secp224r1
	jmp	.LBB43_21
.LBB43_21:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movq	%rbp, %rdi
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_71
.LBB43_72:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	movq	%rbx, %rcx
	movl	$4, %r8d
	jmp	.LBB43_88
.LBB43_86:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r13, %r8
	movq	%rbp, %r9
	retq
.LBB43_88:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	callq	uECC_vli_modAdd
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_74
.LBB43_75:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	jmp	.LBB43_22
.LBB43_22:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movq	%rbp, %rdx
	movl	$4, %ecx
	callq	uECC_vli_mult
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_77
.LBB43_78:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	callq	vli_mmod_fast_secp224r1
	movq	%r12, %rdi
	movq	%r14, %rsi
	jmp	.LBB43_23
.LBB43_23:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movq	(%rsp), %rdx                    # 8-byte Reload
	movl	$4, %ecx
	callq	uECC_vli_mult
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_80
.LBB43_81:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	callq	vli_mmod_fast_secp224r1
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB43_24
.LBB43_24:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movq	%r14, %rdx
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_83
.LBB43_84:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	callq	uECC_vli_modSub
	movaps	176(%rsp), %xmm0
	movaps	192(%rsp), %xmm1
	movaps	%xmm1, 64(%rsp)
	movaps	%xmm0, 48(%rsp)
	jmp	.LBB43_25
.LBB43_25:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movaps	48(%rsp), %xmm0
	movaps	64(%rsp), %xmm1
	movaps	%xmm1, 32(%rsp)
	movaps	%xmm0, 16(%rsp)
	movaps	80(%rsp), %xmm0
	movaps	96(%rsp), %xmm1
	movaps	%xmm1, 160(%rsp)
	movaps	%xmm0, 144(%rsp)
	jmp	.LBB43_26
.LBB43_26:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	movdqa	112(%rsp), %xmm0
	movaps	128(%rsp), %xmm1
	movaps	%xmm1, 224(%rsp)
	movdqa	%xmm0, 208(%rsp)
	movl	8(%rsp), %ecx                   # 4-byte Reload
	addb	%cl, %cl
	movl	12(%rsp), %eax                  # 4-byte Reload
	incb	%al
	jmp	.LBB43_27
.LBB43_27:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	cmpb	$7, %al
	jmp	.LBB43_82
.LBB43_80:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdi
	movq	%r12, %rsi
	retq
.LBB43_82:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	jne	.LBB43_1
.LBB43_4:                               # Block address taken
                                        # Label of block must be emitted
	leaq	16(%rsp), %rdi
	leaq	240(%rsp), %rsi
	leaq	176(%rsp), %rdx
	leaq	48(%rsp), %rcx
	jmp	.LBB43_79
.LBB43_77:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r14, %rdi
	movq	%r12, %rsi
	retq
.LBB43_79:                              # Block address taken
                                        # Label of block must be emitted
	leaq	80(%rsp), %r13
	leaq	112(%rsp), %rbp
	movq	%rsi, %r15
	movq	%rdx, %r12
	jmp	.LBB43_28
.LBB43_28:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rcx, %r14
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_86
.LBB43_87:                              # Block address taken
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	callq	mod_sqrt_secp224r1_rs
	movw	$94, %bx
.LBB43_5:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movaps	16(%rsp), %xmm0
	movaps	32(%rsp), %xmm1
	movaps	%xmm1, 64(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	240(%rsp), %xmm0
	movaps	256(%rsp), %xmm1
	movaps	%xmm1, 96(%rsp)
	movaps	%xmm0, 80(%rsp)
	jmp	.LBB43_29
.LBB43_29:                              # Block address taken
                                        #   in Loop: Header=BB43_5 Depth=1
                                        # Label of block must be emitted
	movaps	176(%rsp), %xmm0
	movaps	192(%rsp), %xmm1
	jmp	.LBB43_73
.LBB43_71:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rsi
	movq	%r15, %rdx
	retq
.LBB43_73:                              # Block address taken
                                        #   in Loop: Header=BB43_5 Depth=1
                                        # Label of block must be emitted
	movaps	%xmm1, 128(%rsp)
	movaps	%xmm0, 112(%rsp)
	jmp	.LBB43_37
.LBB43_35:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	retq
.LBB43_37:                              # Block address taken
                                        #   in Loop: Header=BB43_5 Depth=1
                                        # Label of block must be emitted
	leaq	16(%rsp), %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	movq	%r14, %rcx
	jmp	.LBB43_30
.LBB43_30:                              # Block address taken
                                        #   in Loop: Header=BB43_5 Depth=1
                                        # Label of block must be emitted
	movq	%r13, %r8
	movq	%rbp, %r9
	callq	mod_sqrt_secp224r1_rs
	movdqa	16(%rsp), %xmm0
	por	32(%rsp), %xmm0
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_89
.LBB43_90:                              # Block address taken
                                        #   in Loop: Header=BB43_5 Depth=1
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	subw	$1, %bx
	jmp	.LBB43_31
.LBB43_31:                              # Block address taken
                                        #   in Loop: Header=BB43_5 Depth=1
                                        # Label of block must be emitted
	setb	%al
	cmpl	$65535, %ecx                    # imm = 0xFFFF
	je	.LBB43_7
.LBB43_6:                               # Block address taken
                                        #   in Loop: Header=BB43_5 Depth=1
                                        # Label of block must be emitted
	testb	%al, %al
	jmp	.LBB43_61
.LBB43_59:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	retq
.LBB43_61:                              # Block address taken
                                        #   in Loop: Header=BB43_5 Depth=1
                                        # Label of block must be emitted
	je	.LBB43_5
.LBB43_7:                               # Block address taken
                                        # Label of block must be emitted
	leaq	curve_secp224r1+8(%rip), %rdx
	leaq	176(%rsp), %rbx
	jmp	.LBB43_94
.LBB43_92:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rdi
	movl	$4, %ecx
	retq
.LBB43_94:                              # Block address taken
                                        # Label of block must be emitted
	leaq	80(%rsp), %rsi
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_92
.LBB43_93:                              # Block address taken
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	callq	uECC_vli_modInv
	leaq	272(%rsp), %r14
	leaq	48(%rsp), %rsi
	jmp	.LBB43_32
.LBB43_32:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r14, %rdi
	subq	$400, %rsp                      # imm = 0x190
	callq	.LBB43_95
.LBB43_96:                              # Block address taken
                                        # Label of block must be emitted
	addq	$400, %rsp                      # imm = 0x190
	callq	uECC_vli_mult
	movq	(%rsp), %rdi                    # 8-byte Reload
	movq	%r14, %rsi
	callq	vli_mmod_fast_secp224r1
	addq	$344, %rsp                      # imm = 0x158
	jmp	.LBB43_33
.LBB43_33:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	jmp	.LBB43_91
.LBB43_89:                              # Block address taken
                                        #   in Loop: Header=BB43_5 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	pcmpeqb	.LCPI43_0(%rip), %xmm0
	pmovmskb	%xmm0, %ecx
	retq
.LBB43_91:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	jmp	.LBB43_34
.LBB43_34:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	jmp	.LBB43_58
.LBB43_56:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rdi
	movq	%r12, %rsi
	retq
.LBB43_58:                              # Block address taken
                                        # Label of block must be emitted
	popq	%rbp
	jmp	.LBB43_64
.LBB43_62:                              # Block address taken
                                        #   in Loop: Header=BB43_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rcx
	movl	$4, %r8d
	retq
.LBB43_64:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_def_cfa_offset 8
	popq	%rbp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	retq
.Lfunc_end43:
	.size	mod_sqrt_secp224r1, .Lfunc_end43-mod_sqrt_secp224r1
	.cfi_endproc
                                        # -- End function
	.type	vli_mmod_fast_secp224r1,@function # -- Begin function vli_mmod_fast_secp224r1
vli_mmod_fast_secp224r1:                # @vli_mmod_fast_secp224r1
	.cfi_startproc
# %bb.0:                                # Block address taken
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushq	%rbp
	xorl	%eax, %eax
.LBB44_1:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	(%rsi,%rax,8), %rcx
	subq	$32, %rsp
	callq	.LBB44_32
.LBB44_33:                              # Block address taken
                                        #   in Loop: Header=BB44_1 Depth=1
                                        # Label of block must be emitted
	addq	$32, %rsp
	jmp	.LBB44_55
.LBB44_53:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	48(%rsi), %rsi
	shrdq	$32, %rsi, %rdx
	retq
.LBB44_55:                              # Block address taken
                                        #   in Loop: Header=BB44_1 Depth=1
                                        # Label of block must be emitted
	cmpq	$4, %rax
	jne	.LBB44_1
.LBB44_2:                               # Block address taken
                                        # Label of block must be emitted
	movabsq	$-4294967296, %rcx              # imm = 0xFFFFFFFF00000000
	movl	$0, 28(%rdi)
	jmp	.LBB44_46
.LBB44_44:                              # Block address taken
                                        #   in Loop: Header=BB44_5 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r9, (%rdi,%rcx,8)
	retq
.LBB44_46:                              # Block address taken
                                        # Label of block must be emitted
	leaq	-24(%rsp), %rax
	subq	$32, %rsp
	callq	.LBB44_35
.LBB44_36:                              # Block address taken
                                        # Label of block must be emitted
	addq	$32, %rsp
	shlq	$32, %rdx
	movq	%rdx, -8(%rax)
	movq	32(%rsi), %rdx
	jmp	.LBB44_23
.LBB44_23:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rdx, (%rax)
	subq	$32, %rsp
	callq	.LBB44_38
.LBB44_39:                              # Block address taken
                                        # Label of block must be emitted
	addq	$32, %rsp
	xorl	%edx, %edx
	xorl	%r8d, %r8d
.LBB44_3:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	(%rdi,%rdx,8), %r9
	leaq	(%r9,%r8), %r10
	addq	-40(%rsp,%rdx,8), %r10
	xorl	%r11d, %r11d
	cmpq	%r9, %r10
	setb	%r11b
	cmovneq	%r11, %r8
	subq	$32, %rsp
	callq	.LBB44_41
.LBB44_42:                              # Block address taken
                                        #   in Loop: Header=BB44_3 Depth=1
                                        # Label of block must be emitted
	addq	$32, %rsp
	jmp	.LBB44_24
.LBB44_24:                              # Block address taken
                                        #   in Loop: Header=BB44_3 Depth=1
                                        # Label of block must be emitted
	incq	%rdx
	jmp	.LBB44_58
.LBB44_56:                              # Block address taken
                                        #   in Loop: Header=BB44_9 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%rax, %r8
	xorl	%eax, %eax
	retq
.LBB44_58:                              # Block address taken
                                        #   in Loop: Header=BB44_3 Depth=1
                                        # Label of block must be emitted
	cmpq	$4, %rdx
	jne	.LBB44_3
.LBB44_4:                               # Block address taken
                                        # Label of block must be emitted
	andq	40(%rsi), %rcx
	movq	%rcx, -32(%rsp)
	movq	48(%rsi), %rcx
	jmp	.LBB44_52
.LBB44_50:                              # Block address taken
                                        #   in Loop: Header=BB44_7 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%rcx, %r9
	xorl	%ecx, %ecx
	retq
.LBB44_52:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rcx, -24(%rsp)
	movq	$0, -16(%rsp)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.LBB44_5:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	(%rdi,%rcx,8), %r8
	leaq	(%r8,%rdx), %r9
	addq	-40(%rsp,%rcx,8), %r9
	xorl	%r10d, %r10d
	jmp	.LBB44_49
.LBB44_47:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	32(%rsi), %rdx
	shrdq	$32, %rdx, %rcx
	retq
.LBB44_49:                              # Block address taken
                                        #   in Loop: Header=BB44_5 Depth=1
                                        # Label of block must be emitted
	cmpq	%r8, %r9
	setb	%r10b
	jmp	.LBB44_61
.LBB44_59:                              # Block address taken
                                        #   in Loop: Header=BB44_12 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	shlq	$3, %rdx
	movq	(%rdi,%rdx), %rsi
	retq
.LBB44_61:                              # Block address taken
                                        #   in Loop: Header=BB44_5 Depth=1
                                        # Label of block must be emitted
	cmovneq	%r10, %rdx
	subq	$32, %rsp
	callq	.LBB44_44
.LBB44_45:                              # Block address taken
                                        #   in Loop: Header=BB44_5 Depth=1
                                        # Label of block must be emitted
	addq	$32, %rsp
	jmp	.LBB44_25
.LBB44_25:                              # Block address taken
                                        #   in Loop: Header=BB44_5 Depth=1
                                        # Label of block must be emitted
	incq	%rcx
	cmpq	$4, %rcx
	jne	.LBB44_5
.LBB44_6:                               # Block address taken
                                        # Label of block must be emitted
	movq	24(%rsi), %rcx
	subq	$32, %rsp
	callq	.LBB44_47
.LBB44_48:                              # Block address taken
                                        # Label of block must be emitted
	addq	$32, %rsp
	movq	%rcx, -40(%rsp)
	movq	40(%rsi), %rcx
	shrdq	$32, %rcx, %rdx
	movq	%rdx, -32(%rsp)
	movq	48(%rsi), %rdx
	jmp	.LBB44_26
.LBB44_26:                              # Block address taken
                                        # Label of block must be emitted
	shrdq	$32, %rdx, %rcx
	movq	%rcx, -24(%rsp)
	shrq	$32, %rdx
	movq	%rdx, -16(%rsp)
	xorl	%edx, %edx
	xorl	%ecx, %ecx
.LBB44_7:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%rcx, %r8
	movq	-40(%rsp,%rdx,8), %r9
	subq	$32, %rsp
	callq	.LBB44_50
.LBB44_51:                              # Block address taken
                                        #   in Loop: Header=BB44_7 Depth=1
                                        # Label of block must be emitted
	addq	$32, %rsp
	subq	%r9, (%rdi,%rdx,8)
	setb	%cl
	testq	%r9, %r9
	cmoveq	%r8, %rcx
	jmp	.LBB44_27
.LBB44_27:                              # Block address taken
                                        #   in Loop: Header=BB44_7 Depth=1
                                        # Label of block must be emitted
	incq	%rdx
	cmpq	$4, %rdx
	jne	.LBB44_7
.LBB44_8:                               # Block address taken
                                        # Label of block must be emitted
	movq	40(%rsi), %rdx
	subq	$32, %rsp
	callq	.LBB44_53
.LBB44_54:                              # Block address taken
                                        # Label of block must be emitted
	addq	$32, %rsp
	movq	%rdx, -40(%rsp)
	shrq	$32, %rsi
	movq	%rsi, -32(%rsp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, (%rax)
	jmp	.LBB44_28
.LBB44_28:                              # Block address taken
                                        # Label of block must be emitted
	xorl	%edx, %edx
	xorl	%eax, %eax
.LBB44_9:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%rax, %rsi
	movq	-40(%rsp,%rdx,8), %r8
	subq	$32, %rsp
	callq	.LBB44_56
.LBB44_57:                              # Block address taken
                                        #   in Loop: Header=BB44_9 Depth=1
                                        # Label of block must be emitted
	addq	$32, %rsp
	subq	%r8, (%rdi,%rdx,8)
	setb	%al
	jmp	.LBB44_67
.LBB44_65:                              # Block address taken
                                        #   in Loop: Header=BB44_20 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	(%rdi,%rdx,8), %r9
	leaq	(%r9,%rsi), %r10
	retq
.LBB44_67:                              # Block address taken
                                        #   in Loop: Header=BB44_9 Depth=1
                                        # Label of block must be emitted
	testq	%r8, %r8
	cmoveq	%rsi, %rax
	jmp	.LBB44_29
.LBB44_29:                              # Block address taken
                                        #   in Loop: Header=BB44_9 Depth=1
                                        # Label of block must be emitted
	incq	%rdx
	cmpq	$4, %rdx
	jne	.LBB44_9
.LBB44_10:                              # Block address taken
                                        # Label of block must be emitted
	addl	%ecx, %eax
	negl	%eax
	js	.LBB44_18
.LBB44_11:                              # Block address taken
                                        # Label of block must be emitted
	movl	$4, %ecx
	leaq	curve_secp224r1(%rip), %rax
.LBB44_12:                              # Block address taken
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB44_16 Depth 2
                                        # Label of block must be emitted
	movq	%rcx, %rdx
	decq	%rcx
	testq	%rdx, %rdx
	jle	.LBB44_15
.LBB44_13:                              # Block address taken
                                        #   in Loop: Header=BB44_12 Depth=1
                                        # Label of block must be emitted
	movzbl	%cl, %edx
	subq	$32, %rsp
	callq	.LBB44_59
.LBB44_60:                              # Block address taken
                                        #   in Loop: Header=BB44_12 Depth=1
                                        # Label of block must be emitted
	addq	$32, %rsp
	cmpq	%rsi, 8(%rdx,%rax)
	ja	.LBB44_22
.LBB44_14:                              # Block address taken
                                        #   in Loop: Header=BB44_12 Depth=1
                                        # Label of block must be emitted
	jae	.LBB44_12
.LBB44_15:                              # Block address taken
                                        #   in Loop: Header=BB44_12 Depth=1
                                        # Label of block must be emitted
	xorl	%ecx, %ecx
	jmp	.LBB44_43
.LBB44_41:                              # Block address taken
                                        #   in Loop: Header=BB44_3 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r10, (%rdi,%rdx,8)
	retq
.LBB44_43:                              # Block address taken
                                        #   in Loop: Header=BB44_12 Depth=1
                                        # Label of block must be emitted
	xorl	%edx, %edx
.LBB44_16:                              # Block address taken
                                        #   Parent Loop BB44_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	8(%rax,%rcx,8), %rsi
	subq	$32, %rsp
	callq	.LBB44_62
.LBB44_63:                              # Block address taken
                                        #   in Loop: Header=BB44_16 Depth=2
                                        # Label of block must be emitted
	addq	$32, %rsp
	jmp	.LBB44_64
.LBB44_62:                              # Block address taken
                                        #   in Loop: Header=BB44_16 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%rdx, %rsi
	xorl	%r8d, %r8d
	retq
.LBB44_64:                              # Block address taken
                                        #   in Loop: Header=BB44_16 Depth=2
                                        # Label of block must be emitted
	subq	%rsi, (%rdi,%rcx,8)
	jmp	.LBB44_34
.LBB44_32:                              # Block address taken
                                        #   in Loop: Header=BB44_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rcx, (%rdi,%rax,8)
	incq	%rax
	retq
.LBB44_34:                              # Block address taken
                                        #   in Loop: Header=BB44_16 Depth=2
                                        # Label of block must be emitted
	setb	%r8b
	testq	%rsi, %rsi
	jmp	.LBB44_37
.LBB44_35:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	$0, -16(%rax)
	movl	28(%rsi), %edx
	retq
.LBB44_37:                              # Block address taken
                                        #   in Loop: Header=BB44_16 Depth=2
                                        # Label of block must be emitted
	cmovneq	%r8, %rdx
	jmp	.LBB44_40
.LBB44_38:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movl	40(%rsi), %edx
	movq	%rdx, 8(%rax)
	retq
.LBB44_40:                              # Block address taken
                                        #   in Loop: Header=BB44_16 Depth=2
                                        # Label of block must be emitted
	incq	%rcx
	jmp	.LBB44_30
.LBB44_30:                              # Block address taken
                                        #   in Loop: Header=BB44_16 Depth=2
                                        # Label of block must be emitted
	cmpq	$4, %rcx
	jne	.LBB44_16
.LBB44_17:                              # Block address taken
                                        #   in Loop: Header=BB44_12 Depth=1
                                        # Label of block must be emitted
	movl	$4, %ecx
	jmp	.LBB44_12
.LBB44_18:                              # Block address taken
                                        # Label of block must be emitted
	leaq	curve_secp224r1(%rip), %rcx
.LBB44_19:                              # Block address taken
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB44_20 Depth 2
                                        # Label of block must be emitted
	xorl	%edx, %edx
	xorl	%esi, %esi
.LBB44_20:                              # Block address taken
                                        #   Parent Loop BB44_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	%rsi, %r8
	subq	$32, %rsp
	callq	.LBB44_65
.LBB44_66:                              # Block address taken
                                        #   in Loop: Header=BB44_20 Depth=2
                                        # Label of block must be emitted
	addq	$32, %rsp
	addq	8(%rcx,%rdx,8), %r10
	xorl	%esi, %esi
	cmpq	%r9, %r10
	setb	%sil
	cmoveq	%r8, %rsi
	jmp	.LBB44_31
.LBB44_31:                              # Block address taken
                                        #   in Loop: Header=BB44_20 Depth=2
                                        # Label of block must be emitted
	movq	%r10, (%rdi,%rdx,8)
	incq	%rdx
	cmpq	$4, %rdx
	jne	.LBB44_20
.LBB44_21:                              # Block address taken
                                        #   in Loop: Header=BB44_19 Depth=1
                                        # Label of block must be emitted
	addl	%esi, %eax
	js	.LBB44_19
.LBB44_22:                              # Block address taken
                                        # Label of block must be emitted
	popq	%rbp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	retq
.Lfunc_end44:
	.size	vli_mmod_fast_secp224r1, .Lfunc_end44-vli_mmod_fast_secp224r1
	.cfi_endproc
                                        # -- End function
	.type	mod_sqrt_secp224r1_rs,@function # -- Begin function mod_sqrt_secp224r1_rs
mod_sqrt_secp224r1_rs:                  # @mod_sqrt_secp224r1_rs
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r9, %r14
	movq	%r8, %r12
	movq	%rcx, %r13
	movq	%rdx, %rbx
	movq	%rsi, %r15
	movq	%rdi, 8(%rsp)                   # 8-byte Spill
	leaq	48(%rsp), %rbp
	movq	%rbp, %rdi
	movq	%rcx, %rsi
	movq	%rcx, %rdx
	movl	$4, %ecx
	callq	uECC_vli_mult
	leaq	16(%rsp), %rdi
	movq	%rbp, %rsi
	callq	vli_mmod_fast_secp224r1
	leaq	48(%rsp), %rbp
	movq	%rbp, %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	movl	$4, %ecx
	callq	uECC_vli_mult
	movq	%r15, %rdi
	movq	%rbp, %rsi
	callq	vli_mmod_fast_secp224r1
	leaq	curve_secp224r1+8(%rip), %r12
	movq	8(%rsp), %rdi                   # 8-byte Reload
	leaq	16(%rsp), %r13
	movq	%r13, %rsi
	movq	%r14, %rdx
	movq	%r12, %rcx
	movl	$4, %r8d
	callq	uECC_vli_modAdd
	movq	%r15, %rdi
	movq	%r15, %rsi
	movq	%r15, %rdx
	movq	%r12, %rcx
	movl	$4, %r8d
	callq	uECC_vli_modAdd
	leaq	48(%rsp), %r15
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%r14, %rdx
	movl	$4, %ecx
	callq	uECC_vli_mult
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	vli_mmod_fast_secp224r1
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movl	$4, %r8d
	callq	uECC_vli_modAdd
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movl	$4, %r8d
	addq	$120, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	uECC_vli_modAdd                 # TAILCALL
.Lfunc_end45:
	.size	mod_sqrt_secp224r1_rs, .Lfunc_end45-mod_sqrt_secp224r1_rs
	.cfi_endproc
                                        # -- End function
	.type	vli_mmod_fast_secp256r1,@function # -- Begin function vli_mmod_fast_secp256r1
vli_mmod_fast_secp256r1:                # @vli_mmod_fast_secp256r1
	.cfi_startproc
# %bb.0:                                # Block address taken
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushq	%rbp
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	jmp	.LBB46_35
.LBB46_35:                              # Block address taken
                                        # Label of block must be emitted
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset %rbx, -56
	subq	$96, %rsp
	callq	.LBB46_59
.LBB46_60:                              # Block address taken
                                        # Label of block must be emitted
	addq	$96, %rsp
	.cfi_offset %r14, -32
	jmp	.LBB46_36
.LBB46_36:                              # Block address taken
                                        # Label of block must be emitted
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	xorl	%eax, %eax
.LBB46_1:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	(%rsi,%rax,8), %rcx
	subq	$96, %rsp
	callq	.LBB46_62
.LBB46_63:                              # Block address taken
                                        #   in Loop: Header=BB46_1 Depth=1
                                        # Label of block must be emitted
	addq	$96, %rsp
	cmpq	$4, %rax
	jne	.LBB46_1
.LBB46_2:                               # Block address taken
                                        # Label of block must be emitted
	movabsq	$-4294967296, %rdx              # imm = 0xFFFFFFFF00000000
	jmp	.LBB46_97
.LBB46_95:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	shlq	$32, %rbx
	orq	%r14, %rbx
	retq
.LBB46_97:                              # Block address taken
                                        # Label of block must be emitted
	movq	$0, -40(%rsp)
	jmp	.LBB46_115
.LBB46_113:                             # Block address taken
                                        #   in Loop: Header=BB46_21 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%rdx, %r13
	xorl	%edx, %edx
	retq
.LBB46_115:                             # Block address taken
                                        # Label of block must be emitted
	subq	$96, %rsp
	callq	.LBB46_65
.LBB46_66:                              # Block address taken
                                        # Label of block must be emitted
	addq	$96, %rsp
	movq	%rax, -32(%rsp)
	movups	48(%rsi), %xmm0
	movaps	%xmm0, -24(%rsp)
	xorl	%ecx, %ecx
	jmp	.LBB46_37
.LBB46_37:                              # Block address taken
                                        # Label of block must be emitted
	xorl	%eax, %eax
.LBB46_3:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%rax, %r8
	movq	-40(%rsp,%rcx,8), %r9
	subq	$96, %rsp
	callq	.LBB46_68
.LBB46_69:                              # Block address taken
                                        #   in Loop: Header=BB46_3 Depth=1
                                        # Label of block must be emitted
	addq	$96, %rsp
	cmpq	%r9, %r10
	setb	%al
	jmp	.LBB46_76
.LBB46_74:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rcx, %r9
	shlq	$32, %r9
	retq
.LBB46_76:                              # Block address taken
                                        #   in Loop: Header=BB46_3 Depth=1
                                        # Label of block must be emitted
	cmoveq	%r8, %rax
	movq	%r10, -40(%rsp,%rcx,8)
	jmp	.LBB46_38
.LBB46_38:                              # Block address taken
                                        #   in Loop: Header=BB46_3 Depth=1
                                        # Label of block must be emitted
	incq	%rcx
	cmpq	$4, %rcx
	jne	.LBB46_3
.LBB46_4:                               # Block address taken
                                        # Label of block must be emitted
	xorl	%ecx, %ecx
	jmp	.LBB46_121
.LBB46_119:                             # Block address taken
                                        #   in Loop: Header=BB46_29 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	8(%rax,%rdx,8), %r9
	addq	%rsi, %r9
	retq
.LBB46_121:                             # Block address taken
                                        # Label of block must be emitted
	xorl	%r8d, %r8d
.LBB46_5:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%r8, %r9
	subq	$96, %rsp
	callq	.LBB46_71
.LBB46_72:                              # Block address taken
                                        #   in Loop: Header=BB46_5 Depth=1
                                        # Label of block must be emitted
	addq	$96, %rsp
	jmp	.LBB46_82
.LBB46_80:                              # Block address taken
                                        #   in Loop: Header=BB46_9 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	(%rdi,%rcx,8), %rbx
	leaq	(%rbx,%r10), %r14
	retq
.LBB46_82:                              # Block address taken
                                        #   in Loop: Header=BB46_5 Depth=1
                                        # Label of block must be emitted
	addq	-40(%rsp,%rcx,8), %r11
	jmp	.LBB46_70
.LBB46_68:                              # Block address taken
                                        #   in Loop: Header=BB46_3 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leaq	(%rax,%r9,2), %r10
	xorl	%eax, %eax
	retq
.LBB46_70:                              # Block address taken
                                        #   in Loop: Header=BB46_5 Depth=1
                                        # Label of block must be emitted
	xorl	%r8d, %r8d
	cmpq	%r10, %r11
	setb	%r8b
	cmoveq	%r9, %r8
	jmp	.LBB46_39
.LBB46_39:                              # Block address taken
                                        #   in Loop: Header=BB46_5 Depth=1
                                        # Label of block must be emitted
	movq	%r11, (%rdi,%rcx,8)
	incq	%rcx
	cmpq	$4, %rcx
	jne	.LBB46_5
.LBB46_6:                               # Block address taken
                                        # Label of block must be emitted
	movq	48(%rsi), %rcx
	subq	$96, %rsp
	callq	.LBB46_74
.LBB46_75:                              # Block address taken
                                        # Label of block must be emitted
	addq	$96, %rsp
	movq	%r9, -32(%rsp)
	movq	56(%rsi), %r9
	shrdq	$32, %r9, %rcx
	movq	%rcx, -24(%rsp)
	shrq	$32, %r9
	jmp	.LBB46_40
.LBB46_40:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r9, -16(%rsp)
	jmp	.LBB46_109
.LBB46_107:                             # Block address taken
                                        #   in Loop: Header=BB46_19 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%r15, %rbp
	xorl	%r15d, %r15d
	retq
.LBB46_109:                             # Block address taken
                                        # Label of block must be emitted
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
.LBB46_7:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%r9, %r10
	jmp	.LBB46_103
.LBB46_101:                             # Block address taken
                                        #   in Loop: Header=BB46_17 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%r14, %r13
	xorl	%r14d, %r14d
	retq
.LBB46_103:                             # Block address taken
                                        #   in Loop: Header=BB46_7 Depth=1
                                        # Label of block must be emitted
	movq	-40(%rsp,%rcx,8), %r11
	subq	$96, %rsp
	callq	.LBB46_77
.LBB46_78:                              # Block address taken
                                        #   in Loop: Header=BB46_7 Depth=1
                                        # Label of block must be emitted
	addq	$96, %rsp
	cmpq	%r11, %rbx
	setb	%r9b
	jmp	.LBB46_118
.LBB46_116:                             # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%r9, %r8
	addq	%r10, %r8
	retq
.LBB46_118:                             # Block address taken
                                        #   in Loop: Header=BB46_7 Depth=1
                                        # Label of block must be emitted
	cmoveq	%r10, %r9
	movq	%rbx, -40(%rsp,%rcx,8)
	jmp	.LBB46_41
.LBB46_41:                              # Block address taken
                                        #   in Loop: Header=BB46_7 Depth=1
                                        # Label of block must be emitted
	incq	%rcx
	cmpq	$4, %rcx
	jne	.LBB46_7
.LBB46_8:                               # Block address taken
                                        # Label of block must be emitted
	xorl	%ecx, %ecx
	jmp	.LBB46_112
.LBB46_110:                             # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	32(%rsi), %r12
	andq	%rdx, %r12
	retq
.LBB46_112:                             # Block address taken
                                        # Label of block must be emitted
	xorl	%r10d, %r10d
.LBB46_9:                               # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%r10, %r11
	subq	$96, %rsp
	callq	.LBB46_80
.LBB46_81:                              # Block address taken
                                        #   in Loop: Header=BB46_9 Depth=1
                                        # Label of block must be emitted
	addq	$96, %rsp
	addq	-40(%rsp,%rcx,8), %r14
	xorl	%r10d, %r10d
	cmpq	%rbx, %r14
	setb	%r10b
	cmoveq	%r11, %r10
	jmp	.LBB46_42
.LBB46_42:                              # Block address taken
                                        #   in Loop: Header=BB46_9 Depth=1
                                        # Label of block must be emitted
	movq	%r14, (%rdi,%rcx,8)
	incq	%rcx
	cmpq	$4, %rcx
	jne	.LBB46_9
.LBB46_10:                              # Block address taken
                                        # Label of block must be emitted
	movq	32(%rsi), %rcx
	movq	%rcx, -40(%rsp)
	movl	40(%rsi), %ecx
	movq	%rcx, -32(%rsp)
	jmp	.LBB46_91
.LBB46_89:                              # Block address taken
                                        #   in Loop: Header=BB46_13 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	(%rdi,%rbx,8), %r15
	leaq	(%r15,%r11), %r12
	retq
.LBB46_91:                              # Block address taken
                                        # Label of block must be emitted
	movq	$0, -24(%rsp)
	movq	56(%rsi), %rcx
	movq	%rcx, -16(%rsp)
	xorl	%r11d, %r11d
	jmp	.LBB46_43
.LBB46_43:                              # Block address taken
                                        # Label of block must be emitted
	xorl	%ecx, %ecx
.LBB46_11:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%rcx, %rbx
	subq	$96, %rsp
	callq	.LBB46_83
.LBB46_84:                              # Block address taken
                                        #   in Loop: Header=BB46_11 Depth=1
                                        # Label of block must be emitted
	addq	$96, %rsp
	addq	-40(%rsp,%r11,8), %r15
	xorl	%ecx, %ecx
	cmpq	%r14, %r15
	setb	%cl
	cmoveq	%rbx, %rcx
	jmp	.LBB46_44
.LBB46_44:                              # Block address taken
                                        #   in Loop: Header=BB46_11 Depth=1
                                        # Label of block must be emitted
	movq	%r15, (%rdi,%r11,8)
	incq	%r11
	cmpq	$4, %r11
	jne	.LBB46_11
.LBB46_12:                              # Block address taken
                                        # Label of block must be emitted
	movq	32(%rsi), %r11
	subq	$96, %rsp
	callq	.LBB46_86
.LBB46_87:                              # Block address taken
                                        # Label of block must be emitted
	addq	$96, %rsp
	shldq	$32, %r11, %r14
	movq	%r14, -40(%rsp)
	shrq	$32, %rbx
	movq	48(%rsi), %r14
	shldq	$32, %r14, %r11
	jmp	.LBB46_45
.LBB46_45:                              # Block address taken
                                        # Label of block must be emitted
	andq	%rdx, %r14
	orq	%rbx, %r14
	movq	%r14, -32(%rsp)
	movq	56(%rsi), %rbx
	movq	%rbx, -24(%rsp)
	movq	%r11, -16(%rsp)
	xorl	%ebx, %ebx
	xorl	%r11d, %r11d
.LBB46_13:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%r11, %r14
	subq	$96, %rsp
	callq	.LBB46_89
.LBB46_90:                              # Block address taken
                                        #   in Loop: Header=BB46_13 Depth=1
                                        # Label of block must be emitted
	addq	$96, %rsp
	addq	-40(%rsp,%rbx,8), %r12
	jmp	.LBB46_73
.LBB46_71:                              # Block address taken
                                        #   in Loop: Header=BB46_5 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	(%rdi,%rcx,8), %r10
	leaq	(%r10,%r8), %r11
	retq
.LBB46_73:                              # Block address taken
                                        #   in Loop: Header=BB46_13 Depth=1
                                        # Label of block must be emitted
	xorl	%r11d, %r11d
	cmpq	%r15, %r12
	setb	%r11b
	cmoveq	%r14, %r11
	jmp	.LBB46_46
.LBB46_46:                              # Block address taken
                                        #   in Loop: Header=BB46_13 Depth=1
                                        # Label of block must be emitted
	movq	%r12, (%rdi,%rbx,8)
	incq	%rbx
	cmpq	$4, %rbx
	jne	.LBB46_13
.LBB46_14:                              # Block address taken
                                        # Label of block must be emitted
	movq	40(%rsi), %rbx
	subq	$96, %rsp
	callq	.LBB46_92
.LBB46_93:                              # Block address taken
                                        # Label of block must be emitted
	addq	$96, %rsp
	shldq	$32, %rbx, %r15
	movq	%r15, -40(%rsp)
	shrq	$32, %r14
	movq	%r14, -32(%rsp)
	movq	$0, -24(%rsp)
	jmp	.LBB46_47
.LBB46_47:                              # Block address taken
                                        # Label of block must be emitted
	movl	32(%rsi), %r14d
	subq	$96, %rsp
	callq	.LBB46_95
.LBB46_96:                              # Block address taken
                                        # Label of block must be emitted
	addq	$96, %rsp
	movq	%rbx, -16(%rsp)
	xorl	%r14d, %r14d
	xorl	%ebx, %ebx
.LBB46_15:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%rbx, %r15
	movq	-40(%rsp,%r14,8), %r12
	subq	$96, %rsp
	callq	.LBB46_98
.LBB46_99:                              # Block address taken
                                        #   in Loop: Header=BB46_15 Depth=1
                                        # Label of block must be emitted
	addq	$96, %rsp
	subq	%r12, (%rdi,%r14,8)
	setb	%bl
	jmp	.LBB46_127
.LBB46_125:                             # Block address taken
                                        #   in Loop: Header=BB46_31 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%rcx, %rdx
	movq	%rdx, %rcx
	retq
.LBB46_127:                             # Block address taken
                                        #   in Loop: Header=BB46_15 Depth=1
                                        # Label of block must be emitted
	testq	%r12, %r12
	cmoveq	%r15, %rbx
	jmp	.LBB46_48
.LBB46_48:                              # Block address taken
                                        #   in Loop: Header=BB46_15 Depth=1
                                        # Label of block must be emitted
	incq	%r14
	jmp	.LBB46_94
.LBB46_92:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	48(%rsi), %r14
	movq	%r14, %r15
	retq
.LBB46_94:                              # Block address taken
                                        #   in Loop: Header=BB46_15 Depth=1
                                        # Label of block must be emitted
	cmpq	$4, %r14
	jne	.LBB46_15
.LBB46_16:                              # Block address taken
                                        # Label of block must be emitted
	movups	48(%rsi), %xmm0
	movaps	%xmm0, -40(%rsp)
	movq	$0, -24(%rsp)
	movl	36(%rsi), %r14d
	jmp	.LBB46_79
.LBB46_77:                              # Block address taken
                                        #   in Loop: Header=BB46_7 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	leaq	(%r9,%r11,2), %rbx
	xorl	%r9d, %r9d
	retq
.LBB46_79:                              # Block address taken
                                        # Label of block must be emitted
	movq	40(%rsi), %r15
	andq	%rdx, %r15
	orq	%r14, %r15
	movq	%r15, -16(%rsp)
	jmp	.LBB46_49
.LBB46_49:                              # Block address taken
                                        # Label of block must be emitted
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
.LBB46_17:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%r14, %r12
	movq	-40(%rsp,%r15,8), %r13
	subq	$96, %rsp
	callq	.LBB46_101
.LBB46_102:                             # Block address taken
                                        #   in Loop: Header=BB46_17 Depth=1
                                        # Label of block must be emitted
	addq	$96, %rsp
	subq	%r13, (%rdi,%r15,8)
	setb	%r14b
	testq	%r13, %r13
	cmoveq	%r12, %r14
	jmp	.LBB46_50
.LBB46_50:                              # Block address taken
                                        #   in Loop: Header=BB46_17 Depth=1
                                        # Label of block must be emitted
	incq	%r15
	jmp	.LBB46_64
.LBB46_62:                              # Block address taken
                                        #   in Loop: Header=BB46_1 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rcx, (%rdi,%rax,8)
	incq	%rax
	retq
.LBB46_64:                              # Block address taken
                                        #   in Loop: Header=BB46_17 Depth=1
                                        # Label of block must be emitted
	cmpq	$4, %r15
	jne	.LBB46_17
.LBB46_18:                              # Block address taken
                                        # Label of block must be emitted
	movq	48(%rsi), %r15
	subq	$96, %rsp
	callq	.LBB46_104
.LBB46_105:                             # Block address taken
                                        # Label of block must be emitted
	addq	$96, %rsp
	shldq	$32, %r15, %r13
	movq	%r13, -40(%rsp)
	jmp	.LBB46_106
.LBB46_104:                             # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	56(%rsi), %r12
	movq	%r12, %r13
	retq
.LBB46_106:                             # Block address taken
                                        # Label of block must be emitted
	movq	32(%rsi), %r13
	shrdq	$32, %r13, %r12
	jmp	.LBB46_124
.LBB46_122:                             # Block address taken
                                        #   in Loop: Header=BB46_32 Depth=2
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	(%rdi,%rsi,8), %r9
	leaq	(%r9,%rdx), %r10
	retq
.LBB46_124:                             # Block address taken
                                        # Label of block must be emitted
	movq	%r12, -32(%rsp)
	jmp	.LBB46_51
.LBB46_51:                              # Block address taken
                                        # Label of block must be emitted
	movq	40(%rsi), %r12
	shldq	$32, %r13, %r12
	movq	%r12, -24(%rsp)
	shlq	$32, %r15
	movq	%r15, -16(%rsp)
	xorl	%r12d, %r12d
	xorl	%r15d, %r15d
.LBB46_19:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%r15, %r13
	movq	-40(%rsp,%r12,8), %rbp
	subq	$96, %rsp
	callq	.LBB46_107
.LBB46_108:                             # Block address taken
                                        #   in Loop: Header=BB46_19 Depth=1
                                        # Label of block must be emitted
	addq	$96, %rsp
	subq	%rbp, (%rdi,%r12,8)
	setb	%r15b
	testq	%rbp, %rbp
	cmoveq	%r13, %r15
	jmp	.LBB46_52
.LBB46_52:                              # Block address taken
                                        #   in Loop: Header=BB46_19 Depth=1
                                        # Label of block must be emitted
	incq	%r12
	cmpq	$4, %r12
	jne	.LBB46_19
.LBB46_20:                              # Block address taken
                                        # Label of block must be emitted
	movq	56(%rsi), %r12
	movq	%r12, -40(%rsp)
	subq	$96, %rsp
	callq	.LBB46_110
.LBB46_111:                             # Block address taken
                                        # Label of block must be emitted
	addq	$96, %rsp
	movq	%r12, -32(%rsp)
	movq	40(%rsi), %r12
	movq	%r12, -24(%rsp)
	andq	48(%rsi), %rdx
	jmp	.LBB46_53
.LBB46_53:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rdx, -16(%rsp)
	xorl	%esi, %esi
	xorl	%edx, %edx
.LBB46_21:                              # Block address taken
                                        # =>This Inner Loop Header: Depth=1
                                        # Label of block must be emitted
	movq	%rdx, %r12
	movq	-40(%rsp,%rsi,8), %r13
	subq	$96, %rsp
	callq	.LBB46_113
.LBB46_114:                             # Block address taken
                                        #   in Loop: Header=BB46_21 Depth=1
                                        # Label of block must be emitted
	addq	$96, %rsp
	subq	%r13, (%rdi,%rsi,8)
	setb	%dl
	testq	%r13, %r13
	cmoveq	%r12, %rdx
	jmp	.LBB46_54
.LBB46_54:                              # Block address taken
                                        #   in Loop: Header=BB46_21 Depth=1
                                        # Label of block must be emitted
	incq	%rsi
	cmpq	$4, %rsi
	jne	.LBB46_21
.LBB46_22:                              # Block address taken
                                        # Label of block must be emitted
	addq	%rax, %r8
	subq	$96, %rsp
	callq	.LBB46_116
.LBB46_117:                             # Block address taken
                                        # Label of block must be emitted
	addq	$96, %rsp
	addq	%r11, %rcx
	jmp	.LBB46_85
.LBB46_83:                              # Block address taken
                                        #   in Loop: Header=BB46_11 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	(%rdi,%r11,8), %r14
	leaq	(%r14,%rcx), %r15
	retq
.LBB46_85:                              # Block address taken
                                        # Label of block must be emitted
	addq	%r8, %rcx
	addq	%r14, %rbx
	addq	%r15, %rbx
	addq	%rdx, %rbx
	jmp	.LBB46_55
.LBB46_55:                              # Block address taken
                                        # Label of block must be emitted
	subq	%rbx, %rcx
	leaq	curve_secp256r1(%rip), %rax
	testl	%ecx, %ecx
	js	.LBB46_31
.LBB46_23:                              # Block address taken
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB46_25 Depth 2
                                        #     Child Loop BB46_29 Depth 2
                                        # Label of block must be emitted
	testl	%ecx, %ecx
	jmp	.LBB46_61
.LBB46_59:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	retq
.LBB46_61:                              # Block address taken
                                        #   in Loop: Header=BB46_23 Depth=1
                                        # Label of block must be emitted
	je	.LBB46_24
.LBB46_28:                              # Block address taken
                                        #   in Loop: Header=BB46_23 Depth=1
                                        # Label of block must be emitted
	xorl	%edx, %edx
	jmp	.LBB46_88
.LBB46_86:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	40(%rsi), %rbx
	movq	%rbx, %r14
	retq
.LBB46_88:                              # Block address taken
                                        #   in Loop: Header=BB46_23 Depth=1
                                        # Label of block must be emitted
	xorl	%esi, %esi
.LBB46_29:                              # Block address taken
                                        #   Parent Loop BB46_23 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	%rsi, %r8
	subq	$96, %rsp
	callq	.LBB46_119
.LBB46_120:                             # Block address taken
                                        #   in Loop: Header=BB46_29 Depth=2
                                        # Label of block must be emitted
	addq	$96, %rsp
	xorl	%esi, %esi
	subq	%r9, (%rdi,%rdx,8)
	setb	%sil
	testq	%r9, %r9
	cmoveq	%r8, %rsi
	jmp	.LBB46_56
.LBB46_56:                              # Block address taken
                                        #   in Loop: Header=BB46_29 Depth=2
                                        # Label of block must be emitted
	incq	%rdx
	cmpq	$4, %rdx
	jne	.LBB46_29
.LBB46_30:                              # Block address taken
                                        #   in Loop: Header=BB46_23 Depth=1
                                        # Label of block must be emitted
	subl	%esi, %ecx
	jmp	.LBB46_67
.LBB46_65:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movl	44(%rsi), %eax
	shlq	$32, %rax
	retq
.LBB46_67:                              # Block address taken
                                        #   in Loop: Header=BB46_23 Depth=1
                                        # Label of block must be emitted
	jmp	.LBB46_23
.LBB46_24:                              # Block address taken
                                        #   in Loop: Header=BB46_23 Depth=1
                                        # Label of block must be emitted
	movl	$4, %edx
.LBB46_25:                              # Block address taken
                                        #   Parent Loop BB46_23 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	%rdx, %rsi
	decq	%rdx
	testq	%rsi, %rsi
	jle	.LBB46_28
.LBB46_26:                              # Block address taken
                                        #   in Loop: Header=BB46_25 Depth=2
                                        # Label of block must be emitted
	movzbl	%dl, %esi
	shlq	$3, %rsi
	jmp	.LBB46_100
.LBB46_98:                              # Block address taken
                                        #   in Loop: Header=BB46_15 Depth=1
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	addq	%rbx, %r12
	xorl	%ebx, %ebx
	retq
.LBB46_100:                             # Block address taken
                                        #   in Loop: Header=BB46_25 Depth=2
                                        # Label of block must be emitted
	movq	(%rdi,%rsi), %r8
	cmpq	%r8, 8(%rsi,%rax)
	ja	.LBB46_34
.LBB46_27:                              # Block address taken
                                        #   in Loop: Header=BB46_25 Depth=2
                                        # Label of block must be emitted
	jae	.LBB46_25
	jmp	.LBB46_28
.LBB46_31:                              # Block address taken
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB46_32 Depth 2
                                        # Label of block must be emitted
	xorl	%esi, %esi
	xorl	%edx, %edx
.LBB46_32:                              # Block address taken
                                        #   Parent Loop BB46_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
                                        # Label of block must be emitted
	movq	%rdx, %r8
	subq	$96, %rsp
	callq	.LBB46_122
.LBB46_123:                             # Block address taken
                                        #   in Loop: Header=BB46_32 Depth=2
                                        # Label of block must be emitted
	addq	$96, %rsp
	addq	8(%rax,%rsi,8), %r10
	xorl	%edx, %edx
	cmpq	%r9, %r10
	setb	%dl
	cmoveq	%r8, %rdx
	jmp	.LBB46_57
.LBB46_57:                              # Block address taken
                                        #   in Loop: Header=BB46_32 Depth=2
                                        # Label of block must be emitted
	movq	%r10, (%rdi,%rsi,8)
	incq	%rsi
	cmpq	$4, %rsi
	jne	.LBB46_32
.LBB46_33:                              # Block address taken
                                        #   in Loop: Header=BB46_31 Depth=1
                                        # Label of block must be emitted
	movslq	%ecx, %rcx
	subq	$96, %rsp
	callq	.LBB46_125
.LBB46_126:                             # Block address taken
                                        #   in Loop: Header=BB46_31 Depth=1
                                        # Label of block must be emitted
	addq	$96, %rsp
	testl	%edx, %edx
	js	.LBB46_31
.LBB46_34:                              # Block address taken
                                        # Label of block must be emitted
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	jmp	.LBB46_58
.LBB46_58:                              # Block address taken
                                        # Label of block must be emitted
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	popq	%rbp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	retq
.Lfunc_end46:
	.size	vli_mmod_fast_secp256r1, .Lfunc_end46-vli_mmod_fast_secp256r1
	.cfi_endproc
                                        # -- End function
	.type	double_jacobian_secp256k1,@function # -- Begin function double_jacobian_secp256k1
double_jacobian_secp256k1:              # @double_jacobian_secp256k1
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movdqu	(%rdx), %xmm0
	movdqu	16(%rdx), %xmm1
	por	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	pcmpeqb	%xmm1, %xmm0
	pmovmskb	%xmm0, %eax
	cmpl	$65535, %eax                    # imm = 0xFFFF
	je	.LBB47_10
# %bb.1:
	movq	%rcx, %r14
	movq	%rdx, %r12
	movq	%rsi, %rbx
	movq	%rdi, %r15
	movsbl	(%rcx), %ecx
	movq	%rsp, %rbp
	movq	%rbp, %rdi
	movq	%rsi, %rdx
	callq	uECC_vli_mult
	leaq	64(%rsp), %r13
	movq	%r13, %rdi
	movq	%rbp, %rsi
	callq	*192(%r14)
	movsbl	(%r14), %ecx
	movq	%rsp, %rbp
	movq	%rbp, %rdi
	movq	%r15, %rsi
	movq	%r13, %rdx
	callq	uECC_vli_mult
	leaq	96(%rsp), %rdi
	movq	%rbp, %rsi
	callq	*192(%r14)
	movsbl	(%r14), %ecx
	movq	%rsp, %rbp
	movq	%rbp, %rdi
	movq	%r15, %rsi
	movq	%r15, %rdx
	callq	uECC_vli_mult
	movq	%r15, %rdi
	movq	%rbp, %rsi
	callq	*192(%r14)
	movsbl	(%r14), %ecx
	movq	%rsp, %rbp
	movq	%rbp, %rdi
	movq	%r13, %rsi
	movq	%r13, %rdx
	callq	uECC_vli_mult
	movq	%r13, %rdi
	movq	%rbp, %rsi
	callq	*192(%r14)
	movsbl	(%r14), %ecx
	movq	%rsp, %r13
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	uECC_vli_mult
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	*192(%r14)
	leaq	8(%r14), %r12
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r15, %rdx
	movq	%r12, %rcx
	movl	$4, %r8d
	callq	uECC_vli_modAdd
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	movq	%r12, %rcx
	movl	$4, %r8d
	callq	uECC_vli_modAdd
	testb	$1, (%rbx)
	jne	.LBB47_2
# %bb.7:
	leaq	32(%rbx), %rax
	xorl	%ecx, %ecx
.LBB47_8:                               # =>This Inner Loop Header: Depth=1
	movq	-8(%rax), %rdx
	movq	%rdx, %rsi
	shrq	%rsi
	orq	%rcx, %rsi
	movq	%rsi, -8(%rax)
	leaq	-8(%rax), %rsi
	shlq	$63, %rdx
	movq	%rsi, %rax
	movq	%rdx, %rcx
	cmpq	%rbx, %rsi
	ja	.LBB47_8
	jmp	.LBB47_9
.LBB47_2:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB47_3:                               # =>This Inner Loop Header: Depth=1
	movq	%rax, %rdx
	movq	(%rbx,%rcx,8), %rsi
	leaq	(%rsi,%rax), %rdi
	addq	(%r12,%rcx,8), %rdi
	xorl	%eax, %eax
	cmpq	%rsi, %rdi
	setb	%al
	cmoveq	%rdx, %rax
	movq	%rdi, (%rbx,%rcx,8)
	incq	%rcx
	cmpq	$4, %rcx
	jne	.LBB47_3
# %bb.4:
	leaq	32(%rbx), %rcx
	xorl	%edx, %edx
.LBB47_5:                               # =>This Inner Loop Header: Depth=1
	movq	-8(%rcx), %rsi
	movq	%rsi, %rdi
	shrq	%rdi
	orq	%rdx, %rdi
	movq	%rdi, -8(%rcx)
	leaq	-8(%rcx), %rdi
	shlq	$63, %rsi
	movq	%rdi, %rcx
	movq	%rsi, %rdx
	cmpq	%rbx, %rdi
	ja	.LBB47_5
# %bb.6:
	shlq	$63, %rax
	orq	%rax, 24(%rbx)
.LBB47_9:
	movsbl	(%r14), %ecx
	movq	%rsp, %r13
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%rbx, %rdx
	callq	uECC_vli_mult
	movq	%r15, %rdi
	movq	%r13, %rsi
	callq	*192(%r14)
	leaq	96(%rsp), %r13
	movq	%r15, %rdi
	movq	%r15, %rsi
	movq	%r13, %rdx
	movq	%r12, %rcx
	movl	$4, %r8d
	callq	uECC_vli_modSub
	movq	%r15, %rdi
	movq	%r15, %rsi
	movq	%r13, %rdx
	movq	%r12, %rcx
	movl	$4, %r8d
	callq	uECC_vli_modSub
	movq	%r13, %rdi
	movq	%r13, %rsi
	movq	%r15, %rdx
	movq	%r12, %rcx
	movl	$4, %r8d
	callq	uECC_vli_modSub
	movsbl	(%r14), %ecx
	movq	%rsp, %r15
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	callq	uECC_vli_mult
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	*192(%r14)
	leaq	64(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rcx
	movl	$4, %r8d
	callq	uECC_vli_modSub
.LBB47_10:
	addq	$136, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end47:
	.size	double_jacobian_secp256k1, .Lfunc_end47-double_jacobian_secp256k1
	.cfi_endproc
                                        # -- End function
	.type	x_side_secp256k1,@function      # -- Begin function x_side_secp256k1
x_side_secp256k1:                       # @x_side_secp256k1
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %rbx
	movq	%rsi, %r15
	movq	%rdi, %r14
	movsbl	(%rdx), %ecx
	movq	%rsp, %r12
	movq	%r12, %rdi
	movq	%rsi, %rdx
	callq	uECC_vli_mult
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	*192(%rbx)
	movsbl	(%rbx), %ecx
	movq	%rsp, %r12
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	callq	uECC_vli_mult
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	*192(%rbx)
	leaq	136(%rbx), %rdx
	addq	$8, %rbx
	movq	%r14, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rcx
	movl	$4, %r8d
	callq	uECC_vli_modAdd
	addq	$72, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end48:
	.size	x_side_secp256k1, .Lfunc_end48-x_side_secp256k1
	.cfi_endproc
                                        # -- End function
	.type	vli_mmod_fast_secp256k1,@function # -- Begin function vli_mmod_fast_secp256k1
vli_mmod_fast_secp256k1:                # @vli_mmod_fast_secp256k1
	.cfi_startproc
# %bb.0:
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -24(%rsp)
	movaps	%xmm0, -40(%rsp)
	movaps	%xmm0, -56(%rsp)
	movaps	%xmm0, -72(%rsp)
	movl	$4, %r8d
	xorl	%r9d, %r9d
	movabsq	$4294968273, %rcx               # imm = 0x1000003D1
.LBB49_1:                               # =>This Inner Loop Header: Depth=1
	movq	%rcx, %rax
	mulq	(%rsi,%r8,8)
	addq	%r9, %rax
	adcq	$0, %rdx
	movq	%rax, -104(%rsp,%r8,8)
	incq	%r8
	movq	%rdx, %r9
	cmpq	$8, %r8
	jne	.LBB49_1
# %bb.2:
	movq	%rdx, -40(%rsp)
	xorl	%eax, %eax
	xorl	%r8d, %r8d
.LBB49_3:                               # =>This Inner Loop Header: Depth=1
	movq	%r8, %rcx
	movq	(%rsi,%rax,8), %rdx
	leaq	(%rdx,%r8), %r9
	addq	-72(%rsp,%rax,8), %r9
	xorl	%r8d, %r8d
	cmpq	%rdx, %r9
	setb	%r8b
	cmoveq	%rcx, %r8
	movq	%r9, (%rdi,%rax,8)
	incq	%rax
	cmpq	$4, %rax
	jne	.LBB49_3
# %bb.4:
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rsi)
	movups	%xmm0, (%rsi)
	movl	$4, %r9d
	xorl	%r10d, %r10d
	movabsq	$4294968273, %rcx               # imm = 0x1000003D1
.LBB49_5:                               # =>This Inner Loop Header: Depth=1
	movq	%rcx, %rax
	mulq	-72(%rsp,%r9,8)
	addq	%r10, %rax
	adcq	$0, %rdx
	movq	%rax, -32(%rsi,%r9,8)
	incq	%r9
	movq	%rdx, %r10
	cmpq	$8, %r9
	jne	.LBB49_5
# %bb.6:
	movq	%rdx, 32(%rsi)
	xorl	%ecx, %ecx
	xorl	%eax, %eax
.LBB49_7:                               # =>This Inner Loop Header: Depth=1
	movq	%rax, %rdx
	movq	(%rdi,%rcx,8), %r9
	leaq	(%r9,%rax), %r10
	addq	(%rsi,%rcx,8), %r10
	xorl	%eax, %eax
	cmpq	%r9, %r10
	setb	%al
	cmoveq	%rdx, %rax
	movq	%r10, (%rdi,%rcx,8)
	incq	%rcx
	cmpq	$4, %rcx
	jne	.LBB49_7
# %bb.8:
	addq	%r8, %rax
	je	.LBB49_13
# %bb.9:
	leaq	curve_secp256k1(%rip), %rcx
.LBB49_10:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB49_11 Depth 2
	xorl	%edx, %edx
	xorl	%esi, %esi
.LBB49_11:                              #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%rcx,%rdx,8), %r8
	addq	%rsi, %r8
	xorl	%r9d, %r9d
	subq	%r8, (%rdi,%rdx,8)
	setb	%r9b
	testq	%r8, %r8
	cmovneq	%r9, %rsi
	incq	%rdx
	cmpq	$4, %rdx
	jne	.LBB49_11
# %bb.12:                               #   in Loop: Header=BB49_10 Depth=1
	decq	%rax
	jne	.LBB49_10
.LBB49_13:
	movl	$4, %ecx
	leaq	curve_secp256k1(%rip), %rax
.LBB49_14:                              # =>This Inner Loop Header: Depth=1
	testq	%rcx, %rcx
	jle	.LBB49_18
# %bb.15:                               #   in Loop: Header=BB49_14 Depth=1
	decq	%rcx
	movzbl	%cl, %edx
	shlq	$3, %rdx
	movq	8(%rdx,%rax), %rsi
	cmpq	%rsi, (%rdi,%rdx)
	ja	.LBB49_16
# %bb.19:                               #   in Loop: Header=BB49_14 Depth=1
	jae	.LBB49_14
	jmp	.LBB49_18
.LBB49_16:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.LBB49_17:                              # =>This Inner Loop Header: Depth=1
	movq	8(%rax,%rcx,8), %rsi
	addq	%rdx, %rsi
	xorl	%r8d, %r8d
	subq	%rsi, (%rdi,%rcx,8)
	setb	%r8b
	testq	%rsi, %rsi
	cmovneq	%r8, %rdx
	incq	%rcx
	cmpq	$4, %rcx
	jne	.LBB49_17
.LBB49_18:
	retq
.Lfunc_end49:
	.size	vli_mmod_fast_secp256k1, .Lfunc_end49-vli_mmod_fast_secp256k1
	.cfi_endproc
                                        # -- End function
	.type	XYcZ_addC,@function             # -- Begin function XYcZ_addC
XYcZ_addC:                              # @XYcZ_addC
	.cfi_startproc
# %bb.0:                                # Block address taken
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushq	%rbp
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	jmp	.LBB50_3
.LBB50_3:                               # Block address taken
                                        # Label of block must be emitted
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$200, %rsp
	.cfi_def_cfa_offset 256
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	jmp	.LBB50_4
.LBB50_4:                               # Block address taken
                                        # Label of block must be emitted
	.cfi_offset %r13, -40
	jmp	.LBB50_48
.LBB50_46:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rsi
	movq	%rbp, %rbx
	retq
.LBB50_48:                              # Block address taken
                                        # Label of block must be emitted
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_25
.LBB50_26:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	.cfi_offset %rbp, -16
	movq	%r8, %r12
	jmp	.LBB50_39
.LBB50_37:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rdi
	movq	%r15, %rsi
	retq
.LBB50_39:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rcx, 24(%rsp)                  # 8-byte Spill
	movq	%rdx, %r15
	movq	%rsi, 16(%rsp)                  # 8-byte Spill
	jmp	.LBB50_5
.LBB50_5:                               # Block address taken
                                        # Label of block must be emitted
	movq	%rdi, %rdx
	movq	%rdi, 8(%rsp)                   # 8-byte Spill
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_28
.LBB50_29:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	leaq	160(%rsp), %rbp
	movq	%rbp, %rdi
	jmp	.LBB50_54
.LBB50_52:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r15, %rdi
	movq	%r15, %rsi
	retq
.LBB50_54:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r15, %rsi
	movq	%r13, %rcx
	jmp	.LBB50_6
.LBB50_6:                               # Block address taken
                                        # Label of block must be emitted
	movl	%r14d, %r8d
	callq	uECC_vli_modSub
	jmp	.LBB50_36
.LBB50_34:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rsi
	movq	%rbp, %rdx
	retq
.LBB50_36:                              # Block address taken
                                        # Label of block must be emitted
	leaq	32(%rsp), %rbx
	jmp	.LBB50_66
.LBB50_64:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	retq
.LBB50_66:                              # Block address taken
                                        # Label of block must be emitted
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_31
.LBB50_32:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	movq	%rbp, %rdx
	jmp	.LBB50_51
.LBB50_49:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbp, %rsi
	movq	%rbp, %rdx
	retq
.LBB50_51:                              # Block address taken
                                        # Label of block must be emitted
	movl	%r14d, %ecx
	callq	uECC_vli_mult
	jmp	.LBB50_7
.LBB50_7:                               # Block address taken
                                        # Label of block must be emitted
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	callq	*192(%r12)
	jmp	.LBB50_45
.LBB50_43:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r13, %rcx
	movl	%r14d, %r8d
	retq
.LBB50_45:                              # Block address taken
                                        # Label of block must be emitted
	movsbl	(%r12), %ecx
	leaq	32(%rsp), %rdi
	movq	8(%rsp), %rbx                   # 8-byte Reload
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_34
.LBB50_35:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	jmp	.LBB50_8
.LBB50_8:                               # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_mult
	movq	%rbx, %rdi
	leaq	32(%rsp), %rsi
	jmp	.LBB50_42
.LBB50_40:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rdx
	movq	%r13, %rcx
	retq
.LBB50_42:                              # Block address taken
                                        # Label of block must be emitted
	callq	*192(%r12)
	movsbl	(%r12), %ecx
	leaq	32(%rsp), %rbp
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_37
.LBB50_38:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	jmp	.LBB50_9
.LBB50_9:                               # Block address taken
                                        # Label of block must be emitted
	leaq	160(%rsp), %rbx
	movq	%rbx, %rdx
	callq	uECC_vli_mult
	movq	%r15, %rdi
	jmp	.LBB50_30
.LBB50_28:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movsbl	(%r8), %r14d
	leaq	8(%r8), %r13
	retq
.LBB50_30:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbp, %rsi
	callq	*192(%r12)
	movq	%rbx, %rdi
	movq	24(%rsp), %rbp                  # 8-byte Reload
	jmp	.LBB50_10
.LBB50_10:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbp, %rsi
	movq	16(%rsp), %rbx                  # 8-byte Reload
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_40
.LBB50_41:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	movl	%r14d, %r8d
	callq	uECC_vli_modAdd
	movq	%rbp, %rdi
	movq	%rbp, %rsi
	jmp	.LBB50_11
.LBB50_11:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbx, %rdx
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_43
.LBB50_44:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	callq	uECC_vli_modSub
	leaq	96(%rsp), %rdi
	movq	%r15, %rsi
	movq	8(%rsp), %rbp                   # 8-byte Reload
	movq	%rbp, %rdx
	jmp	.LBB50_12
.LBB50_12:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r13, %rcx
	movl	%r14d, %r8d
	callq	uECC_vli_modSub
	movsbl	(%r12), %ecx
	leaq	32(%rsp), %rdi
	movq	%rbx, %rsi
	leaq	96(%rsp), %rdx
	callq	uECC_vli_mult
	jmp	.LBB50_13
.LBB50_13:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbx, %rdi
	leaq	32(%rsp), %rsi
	callq	*192(%r12)
	leaq	96(%rsp), %rdi
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_46
.LBB50_47:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	movq	%r15, %rdx
	movq	%r13, %rcx
	jmp	.LBB50_14
.LBB50_14:                              # Block address taken
                                        # Label of block must be emitted
	movl	%r14d, %r8d
	callq	uECC_vli_modAdd
	movsbl	(%r12), %ecx
	jmp	.LBB50_69
.LBB50_67:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rsi
	movq	%r15, %rdx
	retq
.LBB50_69:                              # Block address taken
                                        # Label of block must be emitted
	leaq	32(%rsp), %rdi
	movq	24(%rsp), %rbp                  # 8-byte Reload
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_49
.LBB50_50:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	callq	uECC_vli_mult
	jmp	.LBB50_15
.LBB50_15:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r15, %rdi
	leaq	32(%rsp), %rsi
	callq	*192(%r12)
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_52
.LBB50_53:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	leaq	96(%rsp), %rdx
	movq	%r13, %rcx
	movl	%r14d, %r8d
	jmp	.LBB50_16
.LBB50_16:                              # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_modSub
	leaq	128(%rsp), %rdi
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_55
.LBB50_56:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	movq	%r13, %rcx
	movl	%r14d, %r8d
	callq	uECC_vli_modSub
	movsbl	(%r12), %ecx
	jmp	.LBB50_17
.LBB50_17:                              # Block address taken
                                        # Label of block must be emitted
	leaq	32(%rsp), %r15
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_58
.LBB50_59:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	leaq	128(%rsp), %rdx
	callq	uECC_vli_mult
	jmp	.LBB50_60
.LBB50_58:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%r15, %rdi
	movq	%rbp, %rsi
	retq
.LBB50_60:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbp, %rdi
	movq	%r15, %rsi
	callq	*192(%r12)
	jmp	.LBB50_18
.LBB50_18:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbp, %rdi
	movq	%rbp, %rsi
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movq	%r13, %rcx
	jmp	.LBB50_27
.LBB50_25:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	retq
.LBB50_27:                              # Block address taken
                                        # Label of block must be emitted
	movl	%r14d, %r8d
	callq	uECC_vli_modSub
	jmp	.LBB50_33
.LBB50_31:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	retq
.LBB50_33:                              # Block address taken
                                        # Label of block must be emitted
	movsbl	(%r12), %ecx
	leaq	32(%rsp), %r15
	jmp	.LBB50_19
.LBB50_19:                              # Block address taken
                                        # Label of block must be emitted
	movq	%r15, %rdi
	leaq	160(%rsp), %rdx
	movq	%rdx, %rsi
	jmp	.LBB50_72
.LBB50_70:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rdi, %rdx
	movq	%r13, %rcx
	retq
.LBB50_72:                              # Block address taken
                                        # Label of block must be emitted
	callq	uECC_vli_mult
	leaq	128(%rsp), %rbx
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_61
.LBB50_62:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	movq	8(%rsp), %r15                   # 8-byte Reload
	jmp	.LBB50_20
.LBB50_20:                              # Block address taken
                                        # Label of block must be emitted
	callq	*192(%r12)
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_64
.LBB50_65:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	leaq	96(%rsp), %rbp
	movq	%rbp, %rdx
	movq	%r13, %rcx
	movl	%r14d, %r8d
	callq	uECC_vli_modSub
	jmp	.LBB50_21
.LBB50_21:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbp, %rdi
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_67
.LBB50_68:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	movq	%r13, %rcx
	movl	%r14d, %r8d
	callq	uECC_vli_modSub
	movsbl	(%r12), %ecx
	leaq	32(%rsp), %rbx
	jmp	.LBB50_22
.LBB50_22:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	leaq	160(%rsp), %rdx
	callq	uECC_vli_mult
	jmp	.LBB50_57
.LBB50_55:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rsi
	movq	%r15, %rdx
	retq
.LBB50_57:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	jmp	.LBB50_63
.LBB50_61:                              # Block address taken
                                        # Label of block must be emitted
	addq	$0, (%rsp)
	movq	%rbx, %rdi
	movq	%r15, %rsi
	retq
.LBB50_63:                              # Block address taken
                                        # Label of block must be emitted
	callq	*192(%r12)
	movq	16(%rsp), %rdi                  # 8-byte Reload
	jmp	.LBB50_23
.LBB50_23:                              # Block address taken
                                        # Label of block must be emitted
	movq	%rbp, %rsi
	subq	$256, %rsp                      # imm = 0x100
	callq	.LBB50_70
.LBB50_71:                              # Block address taken
                                        # Label of block must be emitted
	addq	$256, %rsp                      # imm = 0x100
	movl	%r14d, %r8d
	callq	uECC_vli_modSub
	testl	%r14d, %r14d
	jle	.LBB50_2
.LBB50_1:                               # Block address taken
                                        # Label of block must be emitted
	movzbl	%r14b, %edx
	shlq	$3, %rdx
	leaq	128(%rsp), %rsi
	movq	%r15, %rdi
	callq	memcpy@PLT
.LBB50_2:                               # Block address taken
                                        # Label of block must be emitted
	addq	$200, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	jmp	.LBB50_24
.LBB50_24:                              # Block address taken
                                        # Label of block must be emitted
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	popq	%rbp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	retq
.Lfunc_end50:
	.size	XYcZ_addC, .Lfunc_end50-XYcZ_addC
	.cfi_endproc
                                        # -- End function
	.type	vli_modInv_update,@function     # -- Begin function vli_modInv_update
vli_modInv_update:                      # @vli_modInv_update
	.cfi_startproc
# %bb.0:
	testb	$1, (%rdi)
	jne	.LBB51_4
# %bb.1:
	testb	%dl, %dl
	jle	.LBB51_11
# %bb.2:
	movzbl	%dl, %eax
	leaq	(%rdi,%rax,8), %rax
	xorl	%ecx, %ecx
.LBB51_3:                               # =>This Inner Loop Header: Depth=1
	movq	-8(%rax), %rdx
	movq	%rdx, %rsi
	shrq	%rsi
	orq	%rcx, %rsi
	movq	%rsi, -8(%rax)
	leaq	-8(%rax), %rsi
	shlq	$63, %rdx
	movq	%rsi, %rax
	movq	%rdx, %rcx
	cmpq	%rdi, %rsi
	ja	.LBB51_3
.LBB51_11:
	retq
.LBB51_4:
	testb	%dl, %dl
	jle	.LBB51_11
# %bb.5:
	movzbl	%dl, %ecx
	xorl	%r8d, %r8d
	xorl	%eax, %eax
.LBB51_6:                               # =>This Inner Loop Header: Depth=1
	movq	%rax, %r9
	movq	(%rdi,%r8,8), %r10
	leaq	(%r10,%rax), %r11
	addq	(%rsi,%r8,8), %r11
	xorl	%eax, %eax
	cmpq	%r10, %r11
	setb	%al
	cmoveq	%r9, %rax
	movq	%r11, (%rdi,%r8,8)
	incq	%r8
	cmpq	%r8, %rcx
	jne	.LBB51_6
# %bb.7:
	leaq	(%rdi,%rcx,8), %rcx
	xorl	%esi, %esi
.LBB51_8:                               # =>This Inner Loop Header: Depth=1
	movq	-8(%rcx), %r8
	movq	%r8, %r9
	shrq	%r9
	orq	%rsi, %r9
	movq	%r9, -8(%rcx)
	leaq	-8(%rcx), %r9
	shlq	$63, %r8
	movq	%r9, %rcx
	movq	%r8, %rsi
	cmpq	%rdi, %r9
	ja	.LBB51_8
# %bb.9:
	testq	%rax, %rax
	je	.LBB51_11
# %bb.10:
	movsbq	%dl, %rax
	orb	$-128, -1(%rdi,%rax,8)
	retq
.Lfunc_end51:
	.size	vli_modInv_update, .Lfunc_end51-vli_modInv_update
	.cfi_endproc
                                        # -- End function
	.type	uECC_vli_mult,@function         # -- Begin function uECC_vli_mult
uECC_vli_mult:                          # @uECC_vli_mult
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rdx, %rbp
	testb	%cl, %cl
	jle	.LBB52_1
# %bb.4:
	movzbl	%cl, %r11d
	movl	$1, %ebx
	xorl	%r14d, %r14d
	movq	%rbp, %r15
	xorl	%r10d, %r10d
	xorl	%r12d, %r12d
.LBB52_5:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB52_6 Depth 2
	movq	%r10, %r9
	movq	%r15, %r8
	xorl	%r13d, %r13d
	xorl	%r10d, %r10d
.LBB52_6:                               #   Parent Loop BB52_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%r8), %rax
	mulq	(%rsi,%r13,8)
	addq	%rax, %r12
	adcq	%rdx, %r9
	adcq	$0, %r10
	incq	%r13
	addq	$-8, %r8
	cmpq	%r13, %rbx
	jne	.LBB52_6
# %bb.7:                                #   in Loop: Header=BB52_5 Depth=1
	movq	%r12, (%rdi,%r14,8)
	incq	%r14
	incq	%rbx
	addq	$8, %r15
	movq	%r9, %r12
	cmpq	%r11, %r14
	jne	.LBB52_5
	jmp	.LBB52_2
.LBB52_1:
	xorl	%r9d, %r9d
	xorl	%r10d, %r10d
.LBB52_2:
	movsbl	%cl, %eax
	leal	(%rax,%rax), %r8d
	decl	%r8d
	cmpl	%eax, %r8d
	jle	.LBB52_3
# %bb.8:
	movq	%rbp, -8(%rsp)                  # 8-byte Spill
	leal	-1(%rcx), %edx
	movzbl	%dl, %ebx
	movb	$1, %bpl
	movq	%rdi, -16(%rsp)                 # 8-byte Spill
.LBB52_9:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB52_12 Depth 2
	leal	1(%rax), %r14d
	movl	%r14d, %edx
	subb	%cl, %dl
	movslq	%eax, %r15
	cmpb	%cl, %dl
	jge	.LBB52_10
# %bb.11:                               #   in Loop: Header=BB52_9 Depth=1
	movq	%rcx, %rdi
	movl	%r8d, %ecx
	movsbq	%bpl, %rax
	leaq	(%rsi,%rax,8), %r13
	shlq	$3, %rax
	leaq	(,%r15,8), %r8
	subq	%rax, %r8
	addq	-8(%rsp), %r8                   # 8-byte Folded Reload
	xorl	%r11d, %r11d
	xorl	%r12d, %r12d
.LBB52_12:                              #   Parent Loop BB52_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%r8), %rax
	mulq	(%r13,%r11,8)
	addq	%rax, %r9
	adcq	%rdx, %r10
	adcq	$0, %r12
	addq	$-8, %r8
	incq	%r11
	cmpb	%r11b, %bl
	jne	.LBB52_12
# %bb.13:                               #   in Loop: Header=BB52_9 Depth=1
	movl	%ecx, %r8d
	movq	%rdi, %rcx
	movq	-16(%rsp), %rdi                 # 8-byte Reload
	jmp	.LBB52_14
.LBB52_10:                              #   in Loop: Header=BB52_9 Depth=1
	xorl	%r12d, %r12d
.LBB52_14:                              #   in Loop: Header=BB52_9 Depth=1
	movq	%r10, %rdx
	movq	%r9, (%rdi,%r15,8)
	movsbl	%r14b, %eax
	incb	%bpl
	decq	%rbx
	movq	%r12, %r10
	movq	%rdx, %r9
	cmpl	%eax, %r8d
	jg	.LBB52_9
	jmp	.LBB52_15
.LBB52_3:
	movq	%r9, %rdx
.LBB52_15:
	movslq	%r8d, %rax
	movq	%rdx, (%rdi,%rax,8)
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end52:
	.size	uECC_vli_mult, .Lfunc_end52-uECC_vli_mult
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function ollvm
	.type	.Lollvm,@function
.Lollvm:                                # @ollvm
	.cfi_startproc
# %bb.0:
	movl	$0, -4(%rsp)
	testb	%dil, %dil
	jne	.LBB53_3
	jmp	.LBB53_1
	.p2align	4, 0x90
.LBB53_2:                               #   in Loop: Header=BB53_1 Depth=1
	movslq	-4(%rsp), %rax
	movslq	(%rdx,%rax,4), %rax
	xorl	%r8d, (%rcx,%rax,4)
	incl	-4(%rsp)
.LBB53_1:                               # =>This Inner Loop Header: Depth=1
	cmpl	%esi, -4(%rsp)
	jl	.LBB53_2
.LBB53_3:
	retq
.Lfunc_end53:
	.size	.Lollvm, .Lfunc_end53-.Lollvm
	.cfi_endproc
                                        # -- End function
	.type	g_rng_function,@object          # @g_rng_function
	.data
	.p2align	3, 0x0
g_rng_function:
	.quad	default_RNG
	.size	g_rng_function, 8

	.type	curve_secp160r1,@object         # @curve_secp160r1
	.section	.data.rel.ro,"aw",@progbits
	.p2align	3, 0x0
curve_secp160r1:
	.byte	3                               # 0x3
	.byte	20                              # 0x14
	.short	161                             # 0xa1
	.zero	4
	.quad	-2147483649                     # 0xffffffff7fffffff
	.quad	-1                              # 0xffffffffffffffff
	.quad	4294967295                      # 0xffffffff
	.quad	0                               # 0x0
	.quad	-493233409515773353             # 0xf927aed3ca752257
	.quad	128200                          # 0x1f4c8
	.quad	4294967296                      # 0x100000000
	.quad	0                               # 0x0
	.quad	7549031027420429442             # 0x68c38bb913cbfc82
	.quad	-8145477734212802167            # 0x8ef5732846646989
	.quad	1251390824                      # 0x4a96b568
	.quad	298171299061431090              # 0x42351377ac5fb32
	.quad	3560258771535841554             # 0x3168947d59dcc912
	.quad	598091861                       # 0x23a62855
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-9091407904947963323            # 0x81d4d4adc565fa45
	.quad	6106171408909138079             # 0x54bd7a8b65acf89f
	.quad	479706876                       # 0x1c97befc
	.quad	0                               # 0x0
	.quad	double_jacobian_default
	.quad	mod_sqrt_default
	.quad	x_side_default
	.quad	vli_mmod_fast_secp160r1
	.size	curve_secp160r1, 200

	.type	curve_secp192r1,@object         # @curve_secp192r1
	.p2align	3, 0x0
curve_secp192r1:
	.byte	3                               # 0x3
	.byte	24                              # 0x18
	.short	192                             # 0xc0
	.zero	4
	.quad	-1                              # 0xffffffffffffffff
	.quad	-2                              # 0xfffffffffffffffe
	.quad	-1                              # 0xffffffffffffffff
	.quad	0                               # 0x0
	.quad	1471491468346665009             # 0x146bc9b1b4d22831
	.quad	-1713440714                     # 0xffffffff99def836
	.quad	-1                              # 0xffffffffffffffff
	.quad	0                               # 0x0
	.quad	-792902925453160430             # 0xf4ff0afd82ff1012
	.quad	8988939576078862336             # 0x7cbf20eb43a18800
	.quad	1769255009665454326             # 0x188da80eb03090f6
	.quad	8356842117447370769             # 0x73f977a11e794811
	.quad	7138225120784731605             # 0x631011ed6b24cdd5
	.quad	511487955924736632              # 0x7192b95ffc8da78
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-92078683924809295              # 0xfeb8deecc146b9b1
	.quad	1128127154243252297             # 0xfa7e9ab72243049
	.quad	7215053686808805607             # 0x64210519e59c80e7
	.quad	0                               # 0x0
	.quad	double_jacobian_default
	.quad	mod_sqrt_default
	.quad	x_side_default
	.quad	vli_mmod_fast_secp192r1
	.size	curve_secp192r1, 200

	.type	curve_secp224r1,@object         # @curve_secp224r1
	.p2align	3, 0x0
curve_secp224r1:
	.byte	4                               # 0x4
	.byte	28                              # 0x1c
	.short	224                             # 0xe0
	.zero	4
	.quad	1                               # 0x1
	.quad	-4294967296                     # 0xffffffff00000000
	.quad	-1                              # 0xffffffffffffffff
	.quad	4294967295                      # 0xffffffff
	.quad	1431345634452711997             # 0x13dd29455c5c2a3d
	.quad	-256586165981122                # 0xffff16a2e0b8f03e
	.quad	-1                              # 0xffffffffffffffff
	.quad	4294967295                      # 0xffffffff
	.quad	3761210295710391585             # 0x343280d6115c1d21
	.quad	5333319497174618402             # 0x4a03c1d356c21122
	.quad	7761038610888102073             # 0x6bb4bf7f321390b9
	.quad	3071151293                      # 0xb70e0cbd
	.quad	4960013060979850804             # 0x44d5819985007e34
	.quad	-3655949140929067164            # 0xcd4375a05a074764
	.quad	-5334755671375945754            # 0xb5f723fb4c22dfe6
	.quad	3174523784                      # 0xbd376388
	.quad	2813405352741437364             # 0x270b39432355ffb4
	.quad	5783942125095737530             # 0x5044b0b7d7bfd8ba
	.quad	866014579497448022              # 0xc04b3abf5413256
	.quad	3020229253                      # 0xb4050a85
	.quad	double_jacobian_default
	.quad	mod_sqrt_secp224r1
	.quad	x_side_default
	.quad	vli_mmod_fast_secp224r1
	.size	curve_secp224r1, 200

	.type	curve_secp256r1,@object         # @curve_secp256r1
	.p2align	3, 0x0
curve_secp256r1:
	.byte	4                               # 0x4
	.byte	32                              # 0x20
	.short	256                             # 0x100
	.zero	4
	.quad	-1                              # 0xffffffffffffffff
	.quad	4294967295                      # 0xffffffff
	.quad	0                               # 0x0
	.quad	-4294967295                     # 0xffffffff00000001
	.quad	-884452912994769583             # 0xf3b9cac2fc632551
	.quad	-4834901526196019580            # 0xbce6faada7179e84
	.quad	-1                              # 0xffffffffffffffff
	.quad	-4294967296                     # 0xffffffff00000000
	.quad	-819310685055303018             # 0xf4a13945d898c296
	.quad	8575836109218198432             # 0x77037d812deb33a0
	.quad	-523289583788211982             # 0xf8bce6e563a440f2
	.quad	7716867327612699207             # 0x6b17d1f2e12c4247
	.quad	-3767753221892779531            # 0xcbb6406837bf51f5
	.quad	3156516839386865358             # 0x2bce33576b315ece
	.quad	-8149286295562117610            # 0x8ee7eb4a7c0f9e16
	.quad	5756518291402817435             # 0x4fe342e2fe1a7f9b
	.quad	4309448131093880907             # 0x3bce3c3e27d2604b
	.quad	7285987128567378166             # 0x651d06b0cc53b0f6
	.quad	-5482079946633869636            # 0xb3ebbd55769886bc
	.quad	6540974713487397863             # 0x5ac635d8aa3a93e7
	.quad	double_jacobian_default
	.quad	mod_sqrt_default
	.quad	x_side_default
	.quad	vli_mmod_fast_secp256r1
	.size	curve_secp256r1, 200

	.type	curve_secp256k1,@object         # @curve_secp256k1
	.p2align	3, 0x0
curve_secp256k1:
	.byte	4                               # 0x4
	.byte	32                              # 0x20
	.short	256                             # 0x100
	.zero	4
	.quad	-4294968273                     # 0xfffffffefffffc2f
	.quad	-1                              # 0xffffffffffffffff
	.quad	-1                              # 0xffffffffffffffff
	.quad	-1                              # 0xffffffffffffffff
	.quad	-4624529908474429119            # 0xbfd25e8cd0364141
	.quad	-4994812053365940165            # 0xbaaedce6af48a03b
	.quad	-2                              # 0xfffffffffffffffe
	.quad	-1                              # 0xffffffffffffffff
	.quad	6481385041966929816             # 0x59f2815b16f81798
	.quad	188021827762530521              # 0x29bfcdb2dce28d9
	.quad	6170039885052185351             # 0x55a06295ce870b07
	.quad	8772561819708210092             # 0x79be667ef9dcbbac
	.quad	-7185545363635252040            # 0x9c47d08ffb10d4b8
	.quad	-209500633525038055             # 0xfd17b448a6855419
	.quad	6747795201694173352             # 0x5da4fbfc0e1108a8
	.quad	5204712524664259685             # 0x483ada7726a3c465
	.quad	7                               # 0x7
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	double_jacobian_secp256k1
	.quad	mod_sqrt_default
	.quad	x_side_secp256k1
	.quad	vli_mmod_fast_secp256k1
	.size	curve_secp256k1, 200

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"/dev/urandom"
	.size	.L.str, 13

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"/dev/random"
	.size	.L.str.1, 12

	.type	.L__const.x_side_default._3,@object # @__const.x_side_default._3
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	4, 0x0
.L__const.x_side_default._3:
	.quad	3                               # 0x3
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.size	.L__const.x_side_default._3, 32

	.type	.L__const.mod_sqrt_secp224r1_rp.e0,@object # @__const.mod_sqrt_secp224r1_rp.e0
	.p2align	4, 0x0
.L__const.mod_sqrt_secp224r1_rp.e0:
	.quad	1                               # 0x1
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.size	.L__const.mod_sqrt_secp224r1_rp.e0, 32

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym default_RNG
	.addrsig_sym double_jacobian_default
	.addrsig_sym mod_sqrt_default
	.addrsig_sym x_side_default
	.addrsig_sym vli_mmod_fast_secp160r1
	.addrsig_sym vli_mmod_fast_secp192r1
	.addrsig_sym mod_sqrt_secp224r1
	.addrsig_sym vli_mmod_fast_secp224r1
	.addrsig_sym vli_mmod_fast_secp256r1
	.addrsig_sym double_jacobian_secp256k1
	.addrsig_sym x_side_secp256k1
	.addrsig_sym vli_mmod_fast_secp256k1
	.addrsig_sym curve_secp160r1
	.addrsig_sym curve_secp192r1
	.addrsig_sym curve_secp224r1
	.addrsig_sym curve_secp256r1
	.addrsig_sym curve_secp256k1
