.data
    Peso1: .asciiz "Peso 1 = "
    Peso2: .asciiz " e Peso 2 = "
    PesoN1: .asciiz "Peso n1 = "
    PesoN2: .asciiz " e Peso n2 = "
    Quebra_de_Linha: .asciiz "\n"
    Solicitar_Taxa: .asciiz "Insira a taxa de aprendizado: "
    Exibir_Taxa: .asciiz "Taxa de aprendizado: "
    Solicitar_Repeticao: .asciiz "Insira o numero de repetições a serem feitas: "
    Exibir_Repeticao: .asciiz "Numero de repetições a serem feitas: "
    Soma: .asciiz " + " 
    Igual: .asciiz " = " 
    
.text
	#f1 = Peso1
	#f2 = Peso2
	#f3 = Taxa de aprendizado
	#$t0 = Condicional do for
	#$s0 = i (Controle For)
	#$s1 = Repetições
	#$f4 = auxiliar conta dos peso1
	#$f5 = auxiliar conta dos peso2
	#$f6 = Soma dos Pesos
	#$f7 = Soma dos Numeros
	#$f8 = Diferenca entre Soma dos Numeros e Soma dos Pesos
	#$f9 = aux rejuste peso1
	#$f10 = aux rejuste peso2

#Gerando peso n1
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Peso1 # $a0 recebe endereço Peso1
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0
    
    li $v0,43 #$v0 = 43 -> random float
    syscall #Recebe valor random em $f0
    
    mov.s $f1,$f0 # Movendo valor do $f0 para $f1
    
    li $v0,2 #$v0 = 2 -> print float
    mov.s $f12,$f1  # Movendo valor do $f1 para $f2
    syscall #$f12 = float a ser exibido  -- Exibir na tela $f12
    
#Gerando peso n2    
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Peso2 #$a0 recebe endereço Peso2
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0
    
    li $v0,43 #$v0 = 43 -> random float
    syscall #Recebe valor random em $f0
    
    mov.s $f2,$f0 #Movendo valor do $f0 para $f2
    
    li $v0,2 #$v0 = 2 -> print float
    mov.s $f12,$f2 #Movendo valor do $f2 para $f12 
    syscall #$f12 = float a ser exibido -- Exibir na tela $f12
    
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Quebra_de_Linha #$a0 recebe endereço Quebra_de_Linha
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0  
    
#Receber taxa de apredizado
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Solicitar_Taxa #$a0 recebe endereço Solicitar_Taxa 
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0
    
    li $v0,6 #$v0 = 6 -> read float
    syscall #Recebe valor digitado em $f0
    
    mov.s $f3,$f0 #Movendo valor do $f0 para $f3
    
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Exibir_Taxa #$a0 recebe endereço Exibir_Taxa
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0
    
    li $v0,2 #$v0 = 2 -> print float
    mov.s $f12,$f3 #Movendo valor do $f3 para $f12
    syscall #$f12 = float a ser exibido -- Exibir na tela $f12
    
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Quebra_de_Linha #$a0 recebe endereço Quebra_de_Linha
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0  
 
#Receber numero de repetições
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Solicitar_Repeticao #$a0 recebe endereço Solicitar_Repeticao
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0
    
    li $v0,5 #$v0 = 5 -> read int
    syscall #Recebe valor digitado em $v0
    
    move $s1,$v0 #Movendo valor do $v0 para $s1
    
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Exibir_Repeticao #$a0 recebe endereço Exibir_Repeticao
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0
    
    li $v0,1 #$v0 = 1 -> print int
    move $a0,$s1 #Movendo valor do $s1 para $a0
    syscall #$a0 = int a ser exibido -- Exibir na tela $a0
    
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Quebra_de_Linha #$a0 recebe endereço Quebra_de_Linha
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0 
    
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Quebra_de_Linha #$a0 recebe endereço Quebra_de_Linha
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0   
    
#Laço de repetição
    li $s0, 1 #$s0 = 1 --> $s0 é o i do for
    addi $s1, $s1, 1 #somar 1 para que seja repetido o numero de vezes digitadas já que a contagem começa no 1 e não no 0	
    FOR1:
    slt $t0, $s0, $s1 #Se $s0 < $s1, $t0 = 1 -- Se $s0 >= $s1, $t0 = 0
    beq $t0, $zero, FIM_FOR1 #Se $t0 == $zero jump para FIM_FOR1, senão segue para proxima linha
    
    #Corpo do for
    
    mtc1 $s0, $f12 #Joga valor de $s0 em $f12
    cvt.s.w $f12, $f12 #Converção de valor para float
    
    mul.s $f4, $f1, $f12 #peso1 * Tentativa
    mul.s $f5, $f2, $f12 #peso2 * Tentativa
    add.s $f6, $f4, $f5 #soma dos pesos
    add.s $f7, $f12, $f12 #soma dos numeros
    
    sub.s $f8, $f7, $f6 #Diferença entre valor correto e valor encontrado
    
    #Rejuste peso1
    mul.s $f9, $f3, $f12 #Taxa * $f12 
    mul.s $f9, $f9, $f8 #(Taxa * $s0) * $f8
    add.s $f1, $f1, $f9 #[(Taxa * $s0) * $f8] + $f1 = $f1
    
    #Rejuste peso2 
    mul.s $f10, $f3, $f12 #Taxa * $f12 
    mul.s $f10, $f10, $f8 #(Taxa * $s0) * $f8
    add.s $f2, $f2, $f10 #[(Taxa * $s0) * $f8] + $f2 = $f2
    
    #Imprimir pesos
    li $v0,4 #$v0 = 4 -> print string
    la $a0,PesoN1 # $a0 recebe endereço Peso1
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0
        
    li $v0,2 #$v0 = 2 -> print float
    mov.s $f12,$f1  # Movendo valor do $f1 para $f2
    syscall #$f12 = float a ser exibido  -- Exibir na tela $f12    
    
    li $v0,4 #$v0 = 4 -> print string
    la $a0,PesoN2 #$a0 recebe endereço Peso2
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0
       
    li $v0,2 #$v0 = 2 -> print float
    mov.s $f12,$f2  # Movendo valor do $f1 para $f2
    syscall #$f12 = float a ser exibido  -- Exibir na tela $f12  
    
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Quebra_de_Linha #$a0 recebe endereço Quebra_de_Linha
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0       
    
    #Ultimos comandos do for
    addi $s0, $s0, 1 #$s0 += 1 -- Variavel de controle do for
    j FOR1 #Jump para FOR1
        
    FIM_FOR1: #Fim do for
    
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Quebra_de_Linha #$a0 recebe endereço Quebra_de_Linha
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0
    
#Laço de repetição
    li $s0, 1 #$s0 = 1 --> $s0 é o i do for	
    FOR2:
    slt $t0, $s0, $s1 #Se $s0 < $s1, $t0 = 1 -- Se $s0 >= $s1, $t0 = 0
    beq $t0, $zero, FIM_FOR2 #Se $t0 == $zero jump para FIM_FOR2, senão segue para proxima linha
    
    #Corpo do for
    mtc1 $s0, $f12 #Joga valor de $s0 em $f12
    cvt.s.w $f12, $f12 #Converção de valor para float
    
    mul.s $f4, $f1, $f12 #peso1 * Tentiva
    mul.s $f5, $f2, $f12 #peso1 * Tentiva
    add.s $f6, $f4, $f5 #soma dos pesos 
         
    #Imprimir pesos        
    li $v0,1 #$v0 = 1 -> print int
    move $a0,$s0  # Movendo valor do $s0 para $a0
    syscall #$a0 = int a ser exibido  -- Exibir na tela $a0   
    
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Soma #$a0 recebe endereço Soma
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0
       
    li $v0,1 #$v0 = 1 -> print int
    move $a0,$s0  # Movendo valor do $s0 para $a0
    syscall #$a0 = int a ser exibido  -- Exibir na tela $a0 
    
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Igual #$a0 recebe endereço Igual
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0
    
    li $v0,2 #$v0 = 2 -> print float
    mov.s $f12,$f6  # Movendo valor do $f6 para $f2
    syscall #$f12 = float a ser exibido  -- Exibir na tela $f12       
    
    li $v0,4 #$v0 = 4 -> print string
    la $a0,Quebra_de_Linha #$a0 recebe endereço Quebra_de_Linha
    syscall #$a0 = String a ser exibida -- Exibir na tela $a0
        
    #Ultimos comandos do for
    addi $s0, $s0, 1 #$s0 += 1 -- Variavel de controle do for
    j FOR2 #Jump para FOR2
        
    FIM_FOR2: #Fim do for


	