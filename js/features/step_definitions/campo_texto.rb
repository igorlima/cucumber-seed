# language: pt
# encoding: utf-8

Quando /^eu preencher "([^\"]*)" no campo "([^\"]*)"$/ do |texto, nome_campo|
  preencher_campo_texto( nome_campo, texto )
end

E /^preencher "([^\"]*)" no campo "([^\"]*)"$/ do |texto, nome_campo|
  preencher_campo_texto( nome_campo, texto )
end

Quando /^eu preencher "([^\"]*)" no campo "([^\"]*)" em "([^\"]*)"$/ do |texto, nome_campo, container|
  preencher_campo_texto_em_container( container, nome_campo, texto )
end

E /^preencher "([^\"]*)" no campo "([^\"]*)" em "([^\"]*)"$/ do |texto, nome_campo, container|
  preencher_campo_texto_em_container( container, nome_campo, texto )
end

private

  def preencher_campo_texto_em_container nome_container, nome_campo, texto
    seletor = create_seletor_campo_texto_em_container nome_container, nome_campo
    preencher_campo_texto_usando_seletor seletor, texto
  end

  def preencher_campo_texto nome_campo, texto
    seletor = create_selector_campo_texto nome_campo
    preencher_campo_texto_usando_seletor seletor, texto
  end

  def preencher_campo_texto_usando_seletor seletor, texto
    elemento_dom = @driver.execute_script("return #{seletor}")
    fail(ArgumentError.new('Campo texto nao encontrado!')) if elemento_dom.nil?

    elemento_dom.send_keys texto
  end

  def seletor_campo_texto
    ".getParent('tr').getElement(\"input[type='text']\")"
  end

  def create_selector_campo_texto nome_campo
    "#{create_selector_campo nome_campo}#{seletor_campo_texto}"
  end

  def create_seletor_campo_texto_em_container nome_container, nome_campo
    seletor_container = create_selector_container nome_container
    "#{seletor_container}.getElement(#{seletor_campo nome_campo})#{seletor_campo_texto}"
  end