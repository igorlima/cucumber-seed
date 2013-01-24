# language: pt
# encoding: utf-8

E /^clicar no botao "([^\"]*)"$/ do |nome_do_botao|
  clicar_no_botao nome_do_botao
end

private

  def clicar_no_botao nome_do_botao
    selector_botao = create_selector_botao( nome_do_botao )
    element_botao = @driver.execute_script("return #{selector_botao}")
    fail(ArgumentError.new('Botao nao encontrado!')) if element_botao.nil?

    element_botao.click
  end

  def create_selector_botao nome_do_botao
    "$$(\"a:contains('#{nome_do_botao}')\")[0]"
  end
