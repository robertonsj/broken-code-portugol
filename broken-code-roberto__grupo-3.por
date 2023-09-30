programa {

  inclua biblioteca Matematica --> mat

  funcao inicio() {

    inteiro projeto 
    
    faca{

      escreva("Escolha o Programa que deseja usar: \n")
      escreva("\n1 - Calculadora")
      escreva("\n2 - Acidentes de Tr�nsito")
      escreva("\n3 - Calcula M�dia Anual \n")
      escreva("\nQual seria o projeto desejado: ")

      leia(projeto)

      se (projeto == "1") retorne Calculadora()
      se (projeto == "2") retorne AcidentesTransito()
      se (projeto == "3") retorne CalculaMedia()

      se(projeto < 1 ou projeto > 3){
        escreva("Op��o Invalida")
      }

    }enquanto(projeto < 1 ou projeto > 3)
  }

  

  funcao Calculadora (){

    caracter condicao
    inteiro n1, n2
    caracter operador

    escreva("Seja Bem-vindo a Calculadora\n\n")
    escreva("Digite um numero:  ")
    leia(n1)

    escreva("\nDigite outro numero: ")
    leia(n2)
    
    escreva("Opera��o desejada: +, -, /, *: ")
    leia(operador)
    
    escolha(operador){
      caso '+':
        escreva("\nResultado: ", n1 + n2)
        pare

      caso '-':
        escreva("\nResultado: ", n1 - n2)
        pare
      caso '/':
        escreva("\nResultado: ", n1 / n2)
        pare

      caso '*':
        escreva("\nResultado: ", n1 * n2)
        pare
      caso contrario:
        escreva("\nInvalid entrance!\n")
    }

    escreva("\nDeseja voltar ao menu inicial Y/N ? \n")
    leia(condicao)

    se(condicao == "Y") {
      inicio()
    } senao se(condicao == "N") {
      escreva("\nVamos Recome�ar\n")
      Calculadora()
    }
  
  }
  

  funcao AcidentesTransito(){
    
    real maior_indice_acidentes = 0, menor_indice_acidentes = 100, 
    media_car, media_acidente = 0, indices[3], soma_acidente = 0
    inteiro cidade_maior_indice, cidade_menor_indice, tot_car = 0, cidade_menos_car = 0,
     qtd_carro[3], numero_acidentes[3]
    inteiro codigos[3]

     para(inteiro i = 0; i < 3; i++){

      escreva("Informe DDD da cidade " + (i+1) + ": ")
      leia(codigos[i])

      escreva("Informe a quantidade de carros da cidade " + (i+1) + ": ")
      leia(qtd_carro[i])

      escreva("Informe a quantidade de acidentes da cidade " + (i+1) + ": ")
      leia(numero_acidentes[i])

      indices[i] = mat.arredondar((numero_acidentes[i] / qtd_carro[i]), 2) 
      
      se(indices[i] > maior_indice_acidentes){
          maior_indice_acidentes = indices[i]
          cidade_maior_indice = i+1
      } senao se(indices[i] < menor_indice_acidentes) {
          menor_indice_acidentes = indices[i]
          cidade_menor_indice = i+1
      }
      se (qtd_carro[i] < 2000){
        cidade_menos_car += 1
        soma_acidente += numero_acidentes[i]
      }
      tot_car += qtd_carro[i]
     }

      media_acidente = mat.arredondar((soma_acidente / cidade_menos_car), 2) //media de acidentes nas cidades com menos de 2000 carros

      media_car = tot_car / 3
     
      escreva("\n\nO maior i�ndice �: ", maior_indice_acidentes * 100, "%. Pertence a cidade ", cidade_maior_indice)
      escreva("\nO menor indice �: " , menor_indice_acidentes * 100, "%. Pertencente a cidade " + cidade_menor_indice)
      escreva("\nCom base em todas as cidades a media de veiculos � ", mat.arredondar(media_car, 2))
      escreva("\nEm cidades com total de carros menor que 2.000 a media de acidentes foi de: " + media_acidente)
  }
  

  funcao CalculaMedia(){
    real result
    real notas[4]
    cadeia nome, restart

    escreva("\nQual o seu nome? ")
    leia(nome)
    
    escreva("\nEntre com as notas das provas: \n")
    para (inteiro i=0; i<4; i++){
      escreva("Avalia��o ", i+1,": ")
      leia(notas)
    }
    
    result = (notas+notas+notas+notas)/4
    
    escreva("\nOl� " + nome + ", sua m�dia � " + notas)
    escreva("\nDeseja calcular uma nova m�dia? S/N ")
    leia(restart)

    se(restart == "S" ou restart == "s") {
      CalculaMedia()
    } senao {
      escreva("\nDeseja voltar ao menu inicial? S/N ")
      leia(restart)
      se(restart == "S" ou restart == "s") {
        inicio()
      }
    }
  }
  
}
