# language: pt
# encoding: utf-8


def seletor_campo nome_campo
  "\"label:contains('#{nome_campo}')\", \"span:contains('#{nome_campo}')\""
end

def create_selector_campo campo
  "$$(#{seletor_campo campo})[0]"
end

def create_selector_container nome_container
  "$$(\"div.header:contains('#{nome_container}')\")[0].getParent('table')"
end

def create_seletor_campo_em_container nome_container, nome_campo
  seletor_container = create_selector_container nome_container
  "#{seletor_container}.getElement(#{seletor_campo nome_campo})"
end

def componente_dom_visivel? tipo_do_campo, campo, opcao
  seletor = create_selector_campo( campo )
  elemento_dom = @driver.execute_script("return #{seletor}")
  elemento_dom.displayed?
end

def componente_dom_visivel_em_container? container, tipo_do_campo, campo, opcao
  seletor = create_seletor_campo_em_container container, campo
  elemento_dom = @driver.execute_script("return #{seletor}")
  elemento_dom.displayed?
end
