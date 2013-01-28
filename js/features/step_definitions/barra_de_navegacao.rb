# language: pt
# encoding: utf-8

E /^clicar na etapa ([0-9]+)$/ do |numero_da_etapa|
  clicar_na_etapa numero_da_etapa
end

Entao /^a etapa ([0-9]+) (deve )?estar habilitada$/ do |numero_da_etapa, deve|
  verifique_status_da_etapa numero_da_etapa, :ativa
end

Entao /^a etapa ([0-9]+) (deve )?ser a etapa atual$/ do |numero_da_etapa, deve|
  verifique_status_da_etapa numero_da_etapa, :atual
end

Entao /^a etapa ([0-9]+) (deve )?estar desabilitada$/ do |numero_da_etapa, deve|
  verifique_status_da_etapa numero_da_etapa, :inativa
end

private

  def clicar_na_etapa numero_da_etapa
    selector = create_selector_etapa numero_da_etapa, nil
    elemento_dom = @driver.execute_script("return #{selector}")
    fail(ArgumentError.new('Botao nao encontrado!')) if elemento_dom.nil?

    elemento_dom.click
  end

  def verifique_status_da_etapa numero_da_etapa, status_da_etapa
    selector = create_selector_etapa numero_da_etapa, status_da_etapa
    elemento_dom = @driver.execute_script("return #{selector}")
    fail(ArgumentError.new("A etapa nao possui o status #{status_da_etapa.to_s}!")) if elemento_dom.nil?
  end

  def create_selector_etapa numero_da_etapa, status_da_etapa

    if status_da_etapa.nil?
      "$$(\".#{estilo_css_etapa :ativa}:contains('#{numero_da_etapa}')\", 
          \".#{estilo_css_etapa :atual}:contains('#{numero_da_etapa}')\", 
          \".#{estilo_css_etapa :inativa}:contains('#{numero_da_etapa}')\")[0]"
    else
      "$$(\".#{estilo_css_etapa status_da_etapa}:contains('#{numero_da_etapa}')\")[0]"
    end

  end

  def estilo_css_etapa status_da_etapa
    case status_da_etapa
      when :ativa    then "application_navigation_linkbox_ativa"
      when :atual    then "application_navigation_linkbox_atual"
      when :inativa  then "application_navigation_linkbox_inativa"  
    end
  end
