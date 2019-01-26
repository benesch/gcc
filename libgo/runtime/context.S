#if defined(__x86_64__)

.globl go_setcontext
go_setcontext:
	movq	16(%rdi), %rbx
	movq	24(%rdi), %rbp
	movq	32(%rdi), %r12
	movq	40(%rdi), %r13
	movq	48(%rdi), %r14
	movq	56(%rdi), %r15
	movq	 8(%rdi), %rsp
	pushq	(%rdi)
	movq	$0, %rax
	ret

.globl go_getcontext
go_getcontext:
	movq	%rbx, 16(%rdi)
	movq	%rbp, 24(%rdi)
	movq	%r12, 32(%rdi)
	movq	%r13, 40(%rdi)
	movq	%r14, 48(%rdi)
	movq	%r15, 56(%rdi)
	movq	(%rsp), %rcx
	movq	%rcx, (%rdi)
	leaq	8(%rsp), %rcx
	movq	%rcx, 8(%rdi)
	movq	$0, %rax
	ret

#endif