# language: pt
# encoding: utf-8

Funcionalidade: Criar um novo modo de uso de Uso Captação em Corpo de Água
   
  Cenario: Criação do modo de uso
    Dado o sistema logado com o usuario "mbov" e com a senha "123"
    Quando selecionar "CAPTAÇÃO EM CORPO DE ÁGUA (RIOS, LAGOAS NATURAIS ETC)" na listagem de "Tipo de uso"
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
      E aguardar 2 segundos para carregar a pagina
    Quando preencher "Gabriel Lunar" no campo "Destinatário" caso esteja vazio
      E preencher "Centro" no campo "Logradouro" em "Endereço para Correspondência" caso esteja vazio
      E preencher "4" no campo "Número" em "Endereço para Correspondência" caso esteja vazio
      E preencher "Centro" no campo "Bairro" em "Endereço para Correspondência" caso esteja vazio
      E selecionar "MG" na listagem de "Estado" em "Endereço para Correspondência"
      E selecionar "Lavras" na listagem de "Municipio" em "Endereço para Correspondência"
      E preencher "Industrial" no campo "Distrito" caso esteja vazio
      E preencher "37200000" no campo "CEP" em "Endereço para Correspondência" caso esteja vazio
      E preencher "455645" no campo "Caixa Postal" em "Endereço para Correspondência" caso esteja vazio
      E preencher "3599991602" no campo "Telefone" em "Endereço para Correspondência" caso esteja vazio
      E preencher "3599991602" no campo "Fax" em "Endereço para Correspondência" caso esteja vazio
      E preencher "igor.ribeiro@gmail.com" no campo "E-mail" caso esteja vazio
      E clicar na etapa 2
      E aguardar 5 segundos para carregar a pagina
