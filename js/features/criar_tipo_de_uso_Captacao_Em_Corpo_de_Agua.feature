# language: pt
# encoding: utf-8

Funcionalidade: Criar um novo modo de uso de Uso Captação em Corpo de Água
   
  Cenario: Criação do modo de uso
    Dado o sistema logado com o usuario "mbov" e com a senha "123"
    Quando eu selecionar "CAPTAÇÃO EM CORPO DE ÁGUA (RIOS, LAGOAS NATURAIS ETC)" na listagem de "Tipo de uso"
      E selecionar "Sim" no campo "Uso Insignificante"
      E clicar no botao "Criar Modo Uso"
    Entao deve aparecer a mensagem de sucesso "A operação foi executada com sucesso"
      E o Modo de Uso "CAPTAÇÃO EM CORPO DE ÁGUA (RIOS, LAGOAS NATURAIS ETC)" deve constar na primeira linha da tabela de caracterizacoes



      
   