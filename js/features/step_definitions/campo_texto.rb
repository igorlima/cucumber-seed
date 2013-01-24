# language: pt
# encoding: utf-8

Quando /^eu preencher "([^\"]*)" no campo "([^\"]*)"$/ do |texto, nome_campo|
  preencher_campo_texto( nome_campo, texto )
end

E /^preencher "([^\"]*)" no campo "([^\"]*)"$/ do |texto, nome_campo|
  preencher_campo_texto( nome_campo, texto )
end

private

  def preencher_campo_texto nome_campo, texto
    seletor = create_selector_campo_texto nome_campo
    elemento_dom = @driver.execute_script("return #{seletor}")
    fail(ArgumentError.new('Campo texto nao encontrado!')) if elemento_dom.nil?

    elemento_dom.send_keys texto
  end

  def create_selector_campo_texto nome_campo
    "#{create_selector_campo nome_campo}.getParent('tr').getElement(\"input[type='text']\")"
  end