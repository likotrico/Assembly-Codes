.data

.text
	addi $a0, $0, 1
	addi $a1, $0, 2
	addi $a2, $0, 3
	addi $a3, $0, 4
	jal F
	
	move $a0, $v0
	addi $v0, $0, 1
	syscall
	
	addi $v0, $0, 10
	syscall
	
	
F: 	addi $sp, $sp, -12 #alocando 3 espaços na pilha
	sw $a0, 0($sp) #salvando o argumento a na pilha 
	sw $a1, 4($sp) #salvando o argumento b na pilha
	sw $ra, 8($sp) #salvando o endereço de volta
	
	add $t0, $a2, $a3 # armazenando o valor de c + d
	jal func
	add $t1, $v0, $0 # armazenando o resultado de func(a, b)
	
	add $a0, $t1, $0 #movendo o resultado de func(a,b) para a segunda chamada da função
	add $a1, $t0, $0 #passando c + d como parâmetro da segunda chamada da função
	jal func
	
	lw $a0, 0($sp) #recuperando o argumento a na pilha 
	lw $a1, 4($sp) #recuperando o argumento b na pilha
	lw $ra, 8($sp) #recuperando o endereço da chamada na pilha
	
	addi $sp, $sp, 12 #desalocando
	
	jr $ra
	
	
func: 	addi $sp, $sp, -12
	sw $a0, 0($sp) #salvando o argumento a na pilha 
	sw $a1, 4($sp) #salvando o argumento b na pilha
	sw $ra, 8($sp) #salvando o endereço de volta
	
	add $v0, $a0, $a1 #realizando a soma dos parâmetros para retornar
	
	lw $a0, 0($sp) #recuperando o argumento a na pilha 
	lw $a1, 4($sp) #recuperando o argumento b na pilha
	lw $ra, 8($sp) #recuperando o endereço da chamada na pilha
	
	addi $sp, $sp, 12 #desalocando
	
	jr $ra
	

		 	