# language: pt

Funcionalidade: Formulário Modo de Uso Captação em Corpo de Água
   
   Cenario: Criação de um novo tipo
      Dado o modulo "Analise Ambiental" aberto
         E o menu principal aberto
         E o item "Análise Ambiental" no menu selecionado
         E o item "Planejamento de Vistorias" no menu selecionado
      Quando eu alterar o campo de data "Data Inicial" para "01/04/2011"
         E eu alterar o campo de data "Data Final" para "05/04/2011"
         E eu clicar no botao "Pesquisar"
         E existir elemento na tabela "Planejamentos Cadastrados"
      Entao eu preciso ver o item "11/04/2011" na tabela "Planejamentos Cadastrados"
      
   

