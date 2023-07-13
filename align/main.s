	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"%x %x %x\n"
.LC1:
	.string	"%d %d %d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	-12(%rbp), %rax
	leaq	8(%rax), %rcx
	leaq	-12(%rbp), %rax
	leaq	4(%rax), %rdx
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$9, %ecx
	movl	$12, %edx
	movl	$12, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.1.0"
	.section	.note.GNU-stack,"",@progbits
