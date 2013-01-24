# language: pt
# encoding: utf-8

Funcionalidade: Criar um novo modo de uso de Uso Captação em Corpo de Água
   
  Cenario: Criação do modo de uso
    Dado o sistema logado com o usuario "mbov" e com a senha "123"
    Quando eu selecionar "CAPTAÇÃO EM CORPO DE ÁGUA (RIOS, LAGOAS NATURAIS ETC)" na listagem de "Tipo de uso"
      E selecionar "Sim" no campo "Uso Insignificante"
      E clicar no botao "Criar Modo Uso"
      E aparecer a mensagem de sucesso "A operação foi executada com sucesso"
      E selecionar "POÇO TUBULAR PROFUNDO" na listagem de "Tipo de uso"
      E clicar no botao "Criar Modo Uso"
    Entao deve aparecer a mensagem de sucesso "A operação foi executada com sucesso"
      E o Modo de Uso "CAPTAÇÃO EM CORPO DE ÁGUA (RIOS, LAGOAS NATURAIS ETC)" deve constar na segunda linha da tabela de caracterizacoes
      E o Modo de Uso "POÇO TUBULAR PROFUNDO" deve constar na primeira linha da tabela de caracterizacoes

  Cenario: Preenchimento da primeira etapa
    Dado o sistema logado com o usuario "mbov" e com a senha "123"
    E clicar no botao "Editar" da primeira linha da tabela de caracterizacoes
    

      
   