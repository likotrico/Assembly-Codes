.text
	addi $t0, $zero, 5 #vari�vel h
	addi $t0, $t0, -5 #opera��o par�nteses
	addi $t1, $zero, 5 #vari�vel g
	add $a0, $t0, $t1
	
	addi $v0, $zero, 1 #imprimindo o resultado
	syscall
	