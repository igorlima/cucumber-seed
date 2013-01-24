# language: pt
# encoding: utf-8

Quando /^selecionar "([^\"]*)" na listagem de "([^\"]*)"$/ do |opcao, nome_do_combobox|
  selecionar_opcao 'combobox', nome_do_combobox, opcao
end

Quando /^selecionar "([^\"]*)" no campo "([^\"]*)"$/ do |opcao, nome_do_radiobutton|
  selecionar_opcao 'radio', nome_do_radiobutton, opcao
end

Quando /^selecionar "([^\"]*)" na listagem de "([^\"]*)" em "([^\"]*)"$/ do |opcao, nome_do_combobox, container|
  selecionar_opcao_em_container container, 'combobox', nome_do_combobox, opcao
end

Quando /^selecionar "([^\"]*)" no campo "([^\"]*)" em "([^\"]*)"$/ do |opcao, nome_do_radiobutton, container|
  selecionar_opcao_em_container container, 'radio', nome_do_radiobutton, opcao
end

private

  def selecionar_opcao tipo_do_campo, campo, opcao
    seletor = create_selector_campo( campo )
    selecionar_opcao_usando_seletor seletor, tipo_do_campo, opcao
  end

  def selecionar_opcao_em_container container, tipo_do_campo, campo, opcao
    seletor = create_seletor_campo_em_container container, campo
    selecionar_opcao_usando_seletor seletor, tipo_do_campo, opcao
  end

  def selecionar_opcao_usando_seletor seletor, tipo_do_campo, opcao
    element_campo = @driver.execute_script("return #{seletor}")
    fail(ArgumentError.new('Campo nao encontrado!')) if element_campo.nil?

    selector_opcao = create_selector_opcao( tipo_do_campo, seletor, opcao )
    element_opcao = @driver.execute_script("return #{selector_opcao}")
    fail(ArgumentError.new('Opcao nao encontrada!')) if element_opcao.nil?

    element_opcao.click
  end

  def create_selector_opcao tipo_do_campo, selector_campo, opcao
    case tipo_do_campo
      when 'combobox' then create_selector_opcao_combobox( selector_campo, opcao )
      when 'radio'    then create_selector_opcao_radio( selector_campo, opcao )
    end
  end

  def selector_opcao_combobox opcao
    ".getParent('tr').getElement(\"option:contains('#{opcao}')\")"
  end

  def create_selector_opcao_combobox selector_campo, opcao
    "#{selector_campo}#{selector_opcao_combobox opcao}"
  end

  def selector_opcao_radio opcao
    ".getParent('tr').getElement(\"span:contains('#{opcao}')\", \"label:contains('#{opcao}')\").previousElementSibling"
  end

  def create_selector_opcao_radio selector_campo, opcao
    "#{selector_campo}#{selector_opcao_radio opcao}"
  end

