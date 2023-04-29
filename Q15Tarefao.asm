.data
	D: .word 1, 2, 3, 4, 5, 6, 7, 8
	espaco: .ascii "-"
.text
	addi $s0, $0, 2 #valor de a
	addi $s1, $0, 2 #valor de b
	add $t0, $0, $0 #valor de i
	add $t1, $0, $0 #valor de j
	la $s2, D
	
	j fori
	
fori:
	bge $t0, $s0, donei #condição de parada do for i
	add $t1, $0, $0 # j = 0 para iniciar o for
	j forj
	
forj:
	bge $t1, $s1, donej #condição de parada do for j
	add $t3, $t0, $t1 #i + j
	sll $t4, $t1, 2 #4*j normal
	sll $t4, $t4, 2 #O endereço de 4*j
	add $t5, $s2, $t4 #D[4*j]
	sw $t3, ($t5) #D[4*j] = i + j
	addi $t1, $t1, 1 #j++
	j forj
	 
donej:
	addi $t0, $t0, 1 #i++
	j fori

donei:
	add $t3, $0, $0 #i = 0 para o imprimir 
	addi $t1, $0, 32 #tamanho do vetor
	j imprimir



imprimir:
	bge $t3, $t1, saiImprimir
	lw $a0, D($t3)
		
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
	