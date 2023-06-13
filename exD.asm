#define N 4

.data
    matriz: .word 1, 0, 0, 0,
            0, 1, 0, 0,
            0, 0, 1, 0,
            0, 0, 0, 1
    is_identidade: .word 1   # Variável para armazenar se é identidade ou não (1 = sim, 0 = não)
    
.text
.globl main
main:
    la $t0, matriz        # Carregando o endereço base da matriz
    la $t1, is_identidade # Carregando o endereço da variável is_identidade
    
    li $t2, N            # Definindo o tamanho da matriz
    
    li $t3, 0            # Variável para verificar se é identidade ou não
    
    loop:
    beq $t2, $zero, exit_loop  # Se t2 = 0, sair do loop
    
    li $t4, 0            # Variável para verificar se o elemento é ou não da diagonal
    
    inner_loop:
    beq $t2, $t4, next_element  # Se t2 = t4, ir para o próximo elemento
    
    lw $t5, 0($t0)       # Carregar o elemento da matriz
    
    bne $t5, 0, not_identidade  # Se o elemento não é zero, não é uma matriz identidade
    
    addi $t0, $t0, 4     # Avançar para o próximo elemento
    
    addi $t4, $t4, 1     # Incrementar o contador
    
    j inner_loop         # Voltar ao início do loop interno
    
    not_identidade:
    li $t3, 1            # Definir a variável para não identidade
    
    exit_loop:
    sw $t3, 0($t1)       # Armazenando o resultado
    
    # Fim do programa
    li $v0, 10           # Código de saída do programa
    syscall

next_element:
    addi $t0, $t0, 4     # Avançar para o próximo elemento
    addi $t4, $t4, 1     # Incrementar o contador
    
    j loop               # Voltar ao início do loop
