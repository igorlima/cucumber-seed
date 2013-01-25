# language: pt
# encoding: utf-8

E /^clicar na etapa ([0-9]+)$/ do |numero_da_etapa|
  clicar_na_etapa numero_da_etapa
end

private

  def clicar_na_etapa numero_da_etapa
    selector = create_selector_etapa( numero_da_etapa )
    elemento_dom = @driver.execute_script("return #{selector}")
    fail(ArgumentError.new('Botao nao encontrado!')) if elemento_dom.nil?

    elemento_dom.click
  end

  def create_selector_etapa numero_da_etapa
    "$$(\".application_navigation_linkbox_inativa:contains('#{numero_da_etapa}')\", 
        \".application_navigation_linkbox_atual:contains('#{numero_da_etapa}')\", 
        \".application_navigation_linkbox_ativa:contains('#{numero_da_etapa}')\")[0]"
  end
