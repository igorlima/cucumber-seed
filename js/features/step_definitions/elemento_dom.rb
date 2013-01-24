# language: pt
# encoding: utf-8



def create_selector_campo campo
  "$$(\"label:contains('#{campo}')\", \"span:contains('#{campo}')\")[0]"
end