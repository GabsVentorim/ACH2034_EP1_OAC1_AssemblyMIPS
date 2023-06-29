.eqv N 10					# Constante para o tamanho dos vetores

.data
	A: .word 1, 2, 3, 4, 5, 6, 7, 9, 10		# Vetor A
	B: .word 11, 12, 13, 14, 15, 16, 17, 18, 19, 20		# Vetor B
    
.text
.globl main
main:
	li $a0, 0				# Variável para armazenar o resultado parcial 
	la $a1, A				# Carregando o endereço base do vetor A
	la $a2, B				# Carregando o endereço base do vetor B
	li $a3, N				# Definindo o tamanho dos vetores (contador)
    
	jal produtoEscalar		# Salta para produtoEscalar e salva a posição
    
	li $v0, 1				# Imprime na tela o resultado do produto escalar
	syscall					# Chama o SO
    
	li $v0, 10				# Código de saída do programa
	syscall					# Chama o SO

produtoEscalar:
	bgt $a3, $zero, calculo # Se $a3 == 0, irá sair do método
    j resultado				# Se for zero, irá ao método resultado
    
calculo:
	subu $sp,$sp,8			# Abre espaço na pilha            
        
    lw $t0, 0($a1)			# Carregar o elemento do vetor A
    lw $t1, 0($a2)  		# Carregar o elemento do vetor B
			      
    mul $t2, $t0, $t1		# Multiplica os elementos
    	
    sw $t2,4($sp)			# Armazena o resultado parcial na pilha               
    sw $ra,0($sp)			# Armazena a posição do programa
    
    addi $a1, $a1, 4		# Avança para o próximo elemento em A
    addi $a2, $a2, 4		# Avança para o próximo elemento em B
    
    subu $a3, $a3, 1		# Decrementar o contador
    	
    jal produtoEscalar		# Volta ao produtoEscalar para verificar se ainda há 					
							# posições para realizar o cálculo
    	
	lw $ra,0($sp)			# Recupera o valor original da proxima posicao
	lw $t3,4($sp)			# Recupera o valor original do $t2 em $t3
	addu $sp,$sp,8			# Retira o espaço ocupado na pilha
    	
    add $a0, $a0, $t3		# Soma o valor que está na pilha ao $a0 (resultado)
    	
resultado:
	jr $ra					# Volta a posição do programa salva na pilha
