# language: pt
# encoding: utf-8

Funcionalidade: Verificar funcionalidades básicas
   
  Cenario: Criação do modo de uso de Captação em Corpo de Água e do modo de uso de Poço Tubular Profundo
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

  Cenario: Acessar etapa não disponivel
    Dado o sistema logado com o usuario "mbov" e com a senha "123"
      E clicar no botao "Editar" da primeira linha da tabela de caracterizacoes
      E aguardar 2 segundos para carregar a pagina
    Quando clicar na etapa 2
    Então deve aparecer um alerta com a mensagem "Uma etapa não pode ser acessada diretamente se não foi preenchida anteriormente ou se não é obrigatória"

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
      E clicar no botao "Gravar"
    Entao deve aparecer a mensagem de sucesso "Formulário salvo com sucesso"
      E a etapa 1 deve ser a etapa atual
      E a etapa 2 deve estar desabilitada

      
      E aguardar 5 segundos para carregar a pagina

  Cenario: Excluir modo de uso de Captação em Corpo de Água criado
    Dado o sistema logado com o usuario "mbov" e com a senha "123"
      E clicar no botao "Excluir" da segunda linha da tabela de caracterizacoes
      E aparecer um alerta com a mensagem "Deseja realmente excluir o modo de uso: CAPTAÇÃO EM CORPO DE ÁGUA (RIOS, LAGOAS NATURAIS ETC) ?"
      E confirmar o alerta
    Entao deve aparecer a mensagem de sucesso "A operação foi executada com sucesso"

  Cenario: Excluir modo de uso de Poço Tubular Profundo criado
    Dado o sistema logado com o usuario "mbov" e com a senha "123"
      E clicar no botao "Excluir" da primeira linha da tabela de caracterizacoes
      E aparecer um alerta com a mensagem "Deseja realmente excluir o modo de uso: POÇO TUBULAR PROFUNDO ?"
      E confirmar o alerta
    Entao deve aparecer a mensagem de sucesso "A operação foi executada com sucesso"