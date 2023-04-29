.text
	addi $t0, $zero, 5 #variável h
	addi $t0, $t0, -5 #operação parênteses
	addi $t1, $zero, 5 #variável g
	add $a0, $t0, $t1
	
	addi $v0, $zero, 1 #imprimindo o resultado
	syscall
	