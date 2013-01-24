# language: pt
# encoding: utf-8

E /^o Modo de Uso "([^\"]*)" deve constar na ([a-z]+) linha da tabela de caracterizacoes$/ do |modo_de_uso, ordem|
	cardinal = converte_ordinal_em_cardinal ordem
  verificar_modo_uso_na_tabela( modo_de_uso, cardinal )
end

E /^o Modo de Uso "([^\"]*)" deve constar na linha ([0-9]+) da tabela de caracterizacoes$/ do |modo_de_uso, ordem|
  verificar_modo_uso_na_tabela( modo_de_uso, ordem )
end

private

	def verificar_modo_uso_na_tabela modo_de_uso, ordem
		fail(ArgumentError.new("Nao EXISTE o modo de uso #{modo_de_uso} na linha #{ordem}")) unless existe_tal_modo_de_uso_na_linha_especificada? modo_de_uso, ordem
	end

	def existe_tal_modo_de_uso_na_linha_especificada? modo_de_uso, ordem
		ordem = ordem.to_i
		selector = "$$(\"#tableAllForms tbody tr\")[#{ordem-1}].getElement(\":contains('#{modo_de_uso}')\")"
		element_dom = @driver.execute_script("return #{selector}")
		not element_dom.nil?
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
