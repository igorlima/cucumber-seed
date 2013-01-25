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

  Cenario: Preenchimento da etapa 1 - Requerente Empreendedor/Empreendimento
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
    Quando clicar no botao "Avançar"
    Entao deve aparecer a mensagem de sucesso "Formulário salvo com sucesso"
      E a etapa 1 deve estar habilitada
      E a etapa 2 deve ser a etapa atual

  Cenario: Validar coordenada sem especificar município na etapa 2 - Localização do Poço Tubular
    Dado o sistema logado com o usuario "mbov" e com a senha "123"
      E clicar no botao "Editar" da primeira linha da tabela de caracterizacoes
      E aguardar 2 segundos para carregar a pagina
    Quando preencher "-21.22" no campo "Latitude (Grau Decimal)"
      E preencher "-45.12" no campo "Longitude (Grau Decimal)"
      E clicar no botao "Validar coordenada"
    Entao deve aparecer a mensagem de erro "Favor selecionar um município"
      E o campo "UPGRH" nao visivel

  Cenario: Validar coordenada especificando um município errado na etapa 2 - Localização do Poço Tubular
    Dado o sistema logado com o usuario "mbov" e com a senha "123"
      E clicar no botao "Editar" da primeira linha da tabela de caracterizacoes
      E aguardar 2 segundos para carregar a pagina
    Quando preencher "-21.22" no campo "Latitude (Grau Decimal)"
      E preencher "-45.12" no campo "Longitude (Grau Decimal)"
      E selecionar "Alfenas" na listagem de "Município"
      E clicar no botao "Validar coordenada"
    Entao deve aparecer a mensagem de erro "A coordenada informada está no municipio de Lavras, diferente do municipio de Alfenas informado"
      E o campo "UPGRH" nao visivel

  Cenario: Validar coordenada na etapa 2 - Localização do Poço Tubular
    Dado o sistema logado com o usuario "mbov" e com a senha "123"
      E clicar no botao "Editar" da primeira linha da tabela de caracterizacoes
      E aguardar 2 segundos para carregar a pagina
    Quando preencher "-21.22" no campo "Latitude (Grau Decimal)"
      E preencher "-45.12" no campo "Longitude (Grau Decimal)"
      E selecionar "Lavras" na listagem de "Município"
      E clicar no botao "Validar coordenada"
    Entao deve aparecer a mensagem de sucesso "Coordenada validada"
      E o campo "UPGRH" visivel
      E o campo "Bacia Federal" visivel
      E o campo "Bacia Estadual" visivel

  Cenario: Preenchimento da etapa 2 - Localização do Poço Tubular
    Dado o sistema logado com o usuario "mbov" e com a senha "123"
      E clicar no botao "Editar" da primeira linha da tabela de caracterizacoes
      E aguardar 2 segundos para carregar a pagina
    Quando selecionar "Vargem Grande do Rio Pardo" na listagem de "Município"
      E preencher "Casa da Goiaba" no campo "Local(fazenda, sítio, etc)"
      E preencher "Próximo da Lagoa Grande" no campo "Referência adicional para chegarmos ao local"
      E preencher "-15.44" no campo "Latitude (Grau Decimal)"
      E preencher "-42.30" no campo "Longitude (Grau Decimal)"
      E clicar no botao "Validar coordenada"
      E aguardar 3 segundos para carregar a pagina
      E aparecer a mensagem de sucesso "Coordenada validada"
      E o campo "UPGRH" visivel
      E o campo "Bacia Federal" visivel
      E o campo "Bacia Estadual" visivel
      E o campo "UPGRH" esteja preenchido com "GD2"
      E o campo "Bacia Federal" esteja preenchido com "Rio Grande"
      E o campo "Bacia Estadual" esteja preenchido com "Rio das Mortes e Rio Jacaré"
      E clicar no botao "Gravar"
    Entao deve aparecer a mensagem de sucesso "Formulário salvo com sucesso"

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