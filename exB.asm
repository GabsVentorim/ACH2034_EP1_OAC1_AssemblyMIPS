.eqv N 4	# Tamanho de cada vetor a realizar o produto escalar

.data
    	A: .word 1, 2, 3, 4		# Vetor A
	B: .word 5, 6, 7, 8		# Vetor B
    
.text
.globl main
main:
	li $a0, 0            # Variavel para armazenar o resultado parcial (alterei o tipo de reg. para reg. de param)
	la $a1, A            # Carregando o endereco base do vetor A (alterei o tipo de reg. para reg. de param)
	la $a2, B            # Carregando o endereco base do vetor B (alterei o tipo de reg. para reg. de param)
	li $a3, N            # Definindo o tamanho dos vetores (alterei o tipo de reg. para reg. de param)
    
    	jal produtoescalar		# Salta para o metodo produto escalar e salva a posicao
    
    	li $v0, 1	# Imprime na tela o resultado do produto escalar
    	syscall
    
    	li $v0, 10	# Codigo de saida do programa
    	syscall

produtoescalar:
	bgt $a3, $zero, calculo  # Se $a3 == 0, sair do metodo
    	j resultado		# Se for zero, vai ao metodo resultado
    
calculo:
	subu $sp,$sp,8		#A bre espaco na pilha            
        
        lw $t0, 0($a1)       # Carregar o elemento do vetor A
    	lw $t1, 0($a2)       # Carregar o elemento do vetor B
			      
    	mul $t2, $t0, $t1    # Multiplica os elementos
    	
    	sw $t2,4($sp)	# Armazena o resultado parcial na pilha               
        sw $ra,0($sp)	# Armazena a posicao do programa
    
    	addi $a1, $a1, 4     # Avancar para o proximo elemento em A
    	addi $a2, $a2, 4     # Avancar para o proximo elemento em B
    
    	addi $a3, $a3, -1    # Decrementar o contador
    	
    	jal produtoescalar	#Volta ao metodo produto escalar para verificar se ainda ha posicoes para realizar o calculo
    	
    	lw $ra,0($sp)		# Recupera o valor original da proxima posicao
        lw $t3,4($sp)		# Recupera o valor original do $t2 em $t3
        addu $sp,$sp,8		# Retira o espaco ocupado na pilha
    	
    	add $a0, $a0, $t3	# Soma o valor que esta na pilha ao $a0 (resultado)
    	
resultado:
	jr $ra		# Volta a posicao do programa salva na pilha
