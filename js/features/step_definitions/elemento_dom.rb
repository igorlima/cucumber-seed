# language: pt
# encoding: utf-8

E /^o campo "([^\"]*)" visivel$/ do |campo|
  fail(ArgumentError.new("O campo #{campo} nao esta visivel!")) unless componente_dom_visivel? campo
end

E /^o campo "([^\"]*)" visivel em "([^\"]*)"$/ do |campo, container|
  fail(ArgumentError.new("O campo #{campo} nao esta visivel em #{containes}")) unless componente_dom_visivel_em_container? container, campo
end

E /^o campo "([^\"]*)" nao visivel$/ do |campo|
  fail(ArgumentError.new("O campo #{campo} esta visivel!")) if componente_dom_visivel? campo
end

E /^o campo "([^\"]*)" nao visivel em "([^\"]*)"$/ do |campo, container|
  fail(ArgumentError.new("O campo #{campo} esta visivel em #{containes}")) if componente_dom_visivel_em_container? container, campo
end

public

  def seletor_campo_abaixo_de_um_outro_campo primeiro_campo, proximo_campo
    "(function(){

      var primeiro_elemento_dom = null;
      var elementos_dom = $$(#{seletor_campo primeiro_campo}, #{seletor_campo proximo_campo});

      elementos_dom.each(
        function(item, index){
          if (item.innerHTML.contains(\"#{primeiro_campo}\")) {
            primeiro_elemento_dom = item;
          }
        }
      );

      var index_primeiro_elemento = elementos_dom.indexOf( primeiro_elemento_dom );
      return elementos_dom[index_primeiro_elemento+1];

    })()"
  end

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

  def componente_dom_visivel? campo
    seletor = create_selector_campo( campo )
    elemento_dom = @driver.execute_script("return #{seletor}")
    elemento_dom.displayed?
  end

  def componente_dom_visivel_em_container? container, campo
    seletor = create_seletor_campo_em_container container, campo
    elemento_dom = @driver.execute_script("return #{seletor}")
    elemento_dom.displayed?
  end
