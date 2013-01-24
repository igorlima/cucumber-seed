# language: pt
# encoding: utf-8

E /^o Modo de Uso "([^\"]*)" deve constar na ([a-z]+) linha da tabela de caracterizacoes$/ do |modo_de_uso, ordem|
  cardinal = converte_ordinal_em_cardinal ordem
  verificar_modo_uso_na_tabela( modo_de_uso, cardinal )
end

E /^o Modo de Uso "([^\"]*)" deve constar na linha ([0-9]+) da tabela de caracterizacoes$/ do |modo_de_uso, ordem|
  verificar_modo_uso_na_tabela( modo_de_uso, ordem )
end

E /^clicar no botao "([^\"]*)" da ([a-z]+) linha da tabela de caracterizacoes$/ do |nome_do_botao, ordem|
  cardinal = converte_ordinal_em_cardinal ordem
  clicar_na_acao( nome_do_botao, cardinal )
end

E /^clicar no botao "([^\"]*)" da linha ([0-9]+) da tabela de caracterizacoes$/ do |nome_do_botao, ordem|
  clicar_na_acao( nome_do_botao, ordem )
end

private

  def clicar_na_acao nome_do_botao, ordem
    selector = "#{selector_da_linha ordem}.getElement(#{create_selector_botao_da_tabela nome_do_botao})"
    element_dom = @driver.execute_script("return #{selector}")
    element_dom.click
  end

  def verificar_modo_uso_na_tabela modo_de_uso, ordem
    fail(ArgumentError.new("Nao EXISTE o modo de uso #{modo_de_uso} na linha #{ordem}")) unless existe_tal_modo_de_uso_na_linha_especificada? modo_de_uso, ordem
  end

  def existe_tal_modo_de_uso_na_linha_especificada? modo_de_uso, ordem
    ordem = ordem.to_i
    selector = "#{selector_da_linha ordem}.getElement(\":contains('#{modo_de_uso}')\")"
    element_dom = @driver.execute_script("return #{selector}")
    not element_dom.nil?
  end

  def selector_da_linha ordem
    "$$(\"#tableAllForms tbody tr\")[#{ordem-1}]"
  end

  def create_selector_botao_da_tabela nome_do_botao
    "\"a[title='#{nome_do_botao}']\""
  end

  def converte_ordinal_em_cardinal ordinal
    case ordinal
      when 'primeira' then 1
      when 'segunda'  then 2
      when 'terceira' then 3
      when 'quarta'   then 4
      else fail(ArgumentError.new('Numero ordinal nao suportado'))
    end
  end
