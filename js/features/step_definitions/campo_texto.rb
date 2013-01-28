# language: pt
# encoding: utf-8

E /^preencher "([^\"]*)" no campo "([^\"]*)"( caso esteja vazio)?$/ do |texto, nome_campo, caso_esteja_vazio|
  preencher_campo_texto nome_campo, texto, caso_esteja_vazio
end

E /^preencher "([^\"]*)" no campo "([^\"]*)" em "([^\"]*)"( caso esteja vazio)?$/ do |texto, nome_campo, container, caso_esteja_vazio|
  preencher_campo_texto_em_container container, nome_campo, texto, caso_esteja_vazio
end

E /^preencher "([^\"]*)" no campo "([^\"]*)" abaixo de "([^\"]*)"( caso esteja vazio)?$/ do |texto, nome_campo, container, caso_esteja_vazio|
  preencher_campo_texto_abaixo_de container, nome_campo, texto, caso_esteja_vazio
end

E /^o campo "([^\"]*)" esteja preenchido com "([^\"]*)"$/ do |campo, texto|
  verificar_conteudo_do_campo_texto texto, campo, nil
end

E /^o campo "([^\"]*)" em "([^\"]*)" esteja preenchido com "([^\"]*)"$/ do |campo, container, texto|
  verificar_conteudo_do_campo_texto texto, campo, container
end

private

  def verificar_conteudo_do_campo_texto texto, campo, container
    seletor = container.nil? ?
              create_selector_campo_texto( campo ) :
              create_seletor_campo_texto_em_container( container, campo )

    conteudo_campo = conteudo_do_campo_texto seletor
    fail(ArgumentError.new("O conteudo do campo NAO eh #{texto}!")) unless texto.eql? conteudo_campo
  end

  def preencher_campo_texto_abaixo_de primeiro_campo, proximo_campo, texto, caso_esteja_vazio
    seletor = create_seletor_campo_abaixo_de_um_outro_campo primeiro_campo, proximo_campo
    preencher_campo_texto_usando_seletor seletor, texto, caso_esteja_vazio
  end

  def preencher_campo_texto_em_container nome_container, nome_campo, texto, caso_esteja_vazio
    seletor = create_seletor_campo_texto_em_container nome_container, nome_campo
    preencher_campo_texto_usando_seletor seletor, texto, caso_esteja_vazio
  end

  def preencher_campo_texto nome_campo, texto, caso_esteja_vazio
    seletor = create_selector_campo_texto nome_campo
    preencher_campo_texto_usando_seletor seletor, texto, caso_esteja_vazio
  end

  def preencher_campo_texto_usando_seletor seletor, texto, caso_esteja_vazio
    elemento_dom = @driver.execute_script("return #{seletor}")
    fail(ArgumentError.new('Campo texto nao encontrado!')) if elemento_dom.nil?
    elemento_dom.click

    if not caso_esteja_vazio.nil?
      text = @driver.execute_script("return #{seletor}.value")
      elemento_dom.send_keys texto if text.empty?
    else
      elemento_dom.send_keys texto
    end

  end

  def conteudo_do_campo_texto seletor
    elemento_dom = @driver.execute_script("return #{seletor}")
    fail(ArgumentError.new('Campo texto nao encontrado!')) if elemento_dom.nil?
    @driver.execute_script("return #{seletor}.value")
  end

  def seletor_campo_texto
    ".getParent('tr').getElement(\"input[type='text']\")"
  end

  def create_selector_campo_texto nome_campo
    "#{create_selector_campo nome_campo}#{seletor_campo_texto}"
  end

  def create_seletor_campo_abaixo_de_um_outro_campo primeiro_campo, proximo_campo
    seletor_container = seletor_campo_abaixo_de_um_outro_campo primeiro_campo, proximo_campo
    "#{seletor_container}#{seletor_campo_texto}"
  end

  def create_seletor_campo_texto_em_container nome_container, nome_campo
    seletor_container = create_seletor_campo_em_container nome_container, nome_campo
    "#{seletor_container}#{seletor_campo_texto}"
  end
