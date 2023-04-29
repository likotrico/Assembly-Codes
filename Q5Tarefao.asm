.data
	Array: .word 2, 4, 3, 6, 1
	espaco: .ascii "-"
.text
	add $t0, $0, $0 #$t0 será o count = 0 inicialmente
	addi $t1, $0, 5 #valor de n = 5
	sll $t1, $t1, 2 #colocando o endereço máximo de n em múltiplo de 4
	subi $t2, $t1, 4 #armazenando o valor de n-1 em $t2
	add $t3, $0, $0 #$t3 será o valor de i, inicialmente i = 0
	j while
	
	while:
		beq $t0, $t2, saida #condição de parada do while
		add $t0, $0, $0 #count = 0;
		add $t3, $0, $0 #i = 0 para o inicio do for;
		j for
		
	for:
		bge $t3, $t2, while#condição de parada do for
		lw $t4, Array($t3) #colocando o valor de Array[i] em $t4
		addi $t5, $t3, 4 #valor de i + 1 em $t5
		lw $t6, Array($t5) #colocando o valor de Array[i+1] em $t6
		bgt $t4, $t6, trocar #indo para o local de realizar as operações de trocar dos valores
		addi $t0, $t0, 4 #count++
		addi $t3, $t3, 4 #i++
		j for
	
	trocar: 
		sw $t6, Array($t3) #Array[i] = Array[i+1]
		sw $t4, Array($t5) #Array[i+1] = aux
		addi $t3, $t3, 4 #i++
		j for		
	
	saida:
		add $t3, $0, $0 #i = 0
		j imprimir
		
	
	imprimir:
		bge $t3, $t1, saiImprimir
		lw $a0, Array($t3)
		
		addi $v0, $0, 1
		syscall
		
		addi $v0, $0, 4
		la $a0, espaco
		syscall
		
		addi $t3, $t3, 4#i++
		j imprimir
		
	saiImprimir:
		addi $v0, $0, 10
		syscall
	
	
	
