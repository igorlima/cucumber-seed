# language: pt
# encoding: utf-8

Quando /^eu selecionar "([^"]*)" na listagem de "([^"]*)"$/ do |opcao, nome_do_combobox|
  selecionar_opcao_em_um_combobox( opcao, nome_do_combobox )
end

E /^selecionar "([^"]*)" na listagem de "([^"]*)"$/ do |opcao, nome_do_combobox|
  selecionar_opcao_em_um_combobox( opcao, nome_do_combobox )
end

Quando /^eu selecionar "([^"]*)" no campo "([^"]*)"$/ do |opcao, nome_do_radiobutton|
  selecionar_opcao_em_um_radio( opcao, nome_do_radiobutton )
end

E /^selecionar "([^"]*)" no campo "([^"]*)"$/ do |opcao, nome_do_radiobutton|
  selecionar_opcao_em_um_radio( opcao, nome_do_radiobutton )
end

private

  def selecionar_opcao_em_um_combobox opcao, campo
    selecionar_opcao opcao, campo, 'combobox'
  end

  def selecionar_opcao_em_um_radio opcao, campo
    selecionar_opcao opcao, campo, 'radio'
  end

  def selecionar_opcao opcao, campo, tipo_do_campo
    selector_campo = create_selector_campo( campo )
    element_campo = @driver.execute_script("return #{selector_campo}")
    fail(ArgumentError.new('Campo nao encontrado!')) if element_campo.nil?

    selector_opcao = create_selector_opcao( tipo_do_campo, selector_campo, opcao )
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

  def create_selector_opcao_combobox selector_campo, opcao
    "#{selector_campo}.getParent('tr').getElement(\"option:contains('#{opcao}')\")"
  end

  def create_selector_opcao_radio selector_campo, opcao
    "#{selector_campo}.getParent('tr').getElement(\"span:contains('#{opcao}')\", \"label:contains('#{opcao}')\").previousElementSibling"
  end

