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