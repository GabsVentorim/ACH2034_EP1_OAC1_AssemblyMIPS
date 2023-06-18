.eqv N 4 #essa eh a forma de definir uma constante em MIPS

.data
    A: .word 1, 2, 3, 4
    B: .word 5, 6, 7, 8
    
.text
.globl main
main:
    li $a0, 0            # Variável para armazenar o resultado parcial (alterei o tipo de reg. para reg. de param)
    la $a1, A            # Carregando o endereço base do vetor A (alterei o tipo de reg. para reg. de param)
    la $a2, B            # Carregando o endereço base do vetor B (alterei o tipo de reg. para reg. de param)
    li $a3, N            # Definindo o tamanho dos vetores (alterei o tipo de reg. para reg. de param)
    
while:
    beq $a3, $zero, exit_while  # Se t2 == 0, sair do loop
    
    lw $t0, 0($a1)       # Carregar o elemento do vetor A (alterar para ld para ter mais espa�o?)
    lw $t1, 0($a2)       # Carregar o elemento do vetor B (alterar para ld para ter mais espa�o?)
    
    			#OBS: pensando em transformar a multiplicacao junto com a soma em uma subrotina nova, pois eh requisito do EP
    mul $t2, $t0, $t1    # Multiplicar os elementos
    
    add $a0, $a0, $t2   # Somar o resultado parcial
    
    			#OBS: transformar a mudanca de posicao em subrotina?
    addi $a1, $a1, 4     # Avançar para o próximo elemento em A
    addi $a2, $a2, 4     # Avançar para o próximo elemento em B
    
    addi $a3, $a3, -1    # Decrementar o contador
    
    j while               # Voltar ao início do while
    
exit_while:
    li $v0, 1	# Imprime na tela o resultado do produto escalar
    syscall
    
    #OBS: fazer subrotina para fechar o programa? (nao acho necessario, mas vai que...)
    # Fim do programa
    li $v0, 10           # Código de saída do programa
    syscall
