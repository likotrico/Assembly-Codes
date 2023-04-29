.data
	A: 
		.align 2 
		.space 4
	C: .word 20, 10, 0
.text
	la $t1, A #endereço base de A
	la $s1, C #endereço base de C
	
	lw $t3, 0($s1) #carregando  o valor presente em C[0]
	sll $t3, $t3, 4 #Shift left em 4 bits
	sw $t3, 0($t1) #atribuindo o valor em C[0] em A[0]
	
	lw $a0, A($0)
	addi $v0, $0, 1
	syscall