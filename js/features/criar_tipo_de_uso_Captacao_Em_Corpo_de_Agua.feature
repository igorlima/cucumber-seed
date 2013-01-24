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
    Quando eu preencher "Gabriel Lunar" no campo "Destinatário"
      E preencher "Centro" no campo "Logradouro"
      E preencher "4" no campo "Número"
      E preencher "Centro" no campo "Bairro"
      E selecionar "MG" no listagem de "Estado"
      E selecionar "Lavras" no listagem de "Munícipio"
      E preencher "Industrial" no campo "Distrito"
      E preencher "37200-000" no campo "CEP"
      E preencher "455645" no campo "Caixa Postal"
      E preencher "3599991602" no campo "Telefone"
      E preencher "3599991602" no campo "Fax"
      E preencher "igor.ribeiro@gmail.com" no campo "Email"

      
   