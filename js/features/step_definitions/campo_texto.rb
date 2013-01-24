# language: pt
# encoding: utf-8

E /^preencher "([^\"]*)" no campo "([^\"]*)"( caso esteja vazio)?$/ do |texto, nome_campo, is_vazio |
  preencher_campo_texto( nome_campo, texto, is_vazio )
end

E /^preencher "([^\"]*)" no campo "([^\"]*)" em "([^\"]*)"( caso esteja vazio)?$/ do |texto, nome_campo, container, is_vazio |
  preencher_campo_texto_em_container( container, nome_campo, texto, is_vazio )
end

private

  def preencher_campo_texto_em_container nome_container, nome_campo, texto, is_vazio
    seletor = create_seletor_campo_texto_em_container nome_container, nome_campo
    preencher_campo_texto_usando_seletor seletor, texto, is_vazio
  end

  def preencher_campo_texto nome_campo, texto, is_vazio
    seletor = create_selector_campo_texto nome_campo
    preencher_campo_texto_usando_seletor seletor, texto, is_vazio
  end

  def preencher_campo_texto_usando_seletor seletor, texto, is_vazio
    elemento_dom = @driver.execute_script("return #{seletor}")
    fail(ArgumentError.new('Campo texto nao encontrado!')) if elemento_dom.nil?

    if not is_vazio.nil?
      text = @driver.execute_script("return #{seletor}.value")
      elemento_dom.send_keys texto if text.empty?
    else
      elemento_dom.send_keys texto
    end

  end

  def seletor_campo_texto
    ".getParent('tr').getElement(\"input[type='text']\")"
  end

  def create_selector_campo_texto nome_campo
    "#{create_selector_campo nome_campo}#{seletor_campo_texto}"
  end

  def create_seletor_campo_texto_em_container nome_container, nome_campo
    seletor_container = create_seletor_campo_em_container nome_container, nome_campo
    "#{seletor_container}#{seletor_campo_texto}"
  end