.data
	A:
		.word 1, 2, 3, 4, 5, 6, 7, 8
		#.align 2 #Array de inteiros
		#.space 32 #alocando 8 espaços
	B:	
		.word 0, 0, 0, 0, 0, 0, 0, 0
		#.align 2
		#.space 32
.text
	addi $s0, $zero, 1 #variável f
	addi $s1, $zero, 2 #variável g
	addi $s2, $zero, 3 #variável h
	addi $s3, $zero, 5 #variável i
	addi $s4, $zero, 3 #variável j
	
	sub $s6, $s3, $s4 #endereço de A
	addi $s7, $zero, 8 #endereço de B
	
	sll $s6, $s6, 2 #multiplicando o valor do endereço por 4
	sll $s7, $s7, 2 #multiplicando o valor do endereço por 4
	
	lw $t0, A($s6) #Colocando o valor de A[i-j]
	sw $t0, B($s7) #Atribuindo A[i-j] em B[8]
	
	lw $a0, B($s7) #imprimindo valor atribuido
	addi $v0, $zero, 1
	syscall
