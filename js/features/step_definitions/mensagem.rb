# language: pt
# encoding: utf-8

Entao /^deve aparecer a mensagem de (sucesso|erro) "([^\"]*)"$/ do |tipo_da_mensagem, mensagem|
  verifique_mensagem tipo_da_mensagem, mensagem
end

E /^aparecer a mensagem de (sucesso|erro) "([^\"]*)"$/ do |tipo_da_mensagem, mensagem|
  verifique_mensagem tipo_da_mensagem, mensagem
end

Entao /^deve aparecer um alerta com a mensagem "([^\"]*)"$/ do |mensagem|
  verifique_alerta mensagem
end

E /^aparecer um alerta com a mensagem "([^\"]*)"$/ do |mensagem|
  verifique_alerta mensagem
end

Entao /^confirme o alerta$/ do
  confirmar_alerta
end

E /^confirmar o alerta$/ do
  confirmar_alerta
end

Entao /^rejeite o alerta$/ do
  rejeitar_alerta
end

E /^rejeitar o alerta$/ do
  rejeitar_alerta
end

private

  def verifique_alerta mensagem
    alerta = @driver.switch_to.alert
    mensagem_do_alerta = alerta.text
    fail(ArgumentError.new("A mensagem nao possui o conteudo: #{mensagem} \nConteudo exibido: #{mensagem_do_alerta}")) unless mensagem.eql? mensagem_do_alerta
  end

  def confirmar_alerta
    @driver.switch_to.alert.accept
  end

  def rejeitar_alerta
    @driver.switch_to.alert.dismiss
  end

  def verifique_mensagem tipo_da_mensagem, mensagem
    fail(ArgumentError.new('Mensagem de alerta nao esta visivel!')) unless is_mensagem_visible?
    fail(ArgumentError.new("Mensagem de alerta nao eh de #{tipo_da_mensagem}.\nMensagem exibida: #{conteudo_da_mensagem_de_alerta}")) unless is? tipo_da_mensagem
    fail(ArgumentError.new("Mensagem de alerta nao possui o conteudo: #{mensagem}.\nMensagem exibida: #{conteudo_da_mensagem_de_alerta}")) unless contains? mensagem
  end

  def create_selector_container_mensagem
    "$$(\"#mensagensContainer\")[0]"
  end

  def is? tipo_da_mensagem
    case tipo_da_mensagem
      when 'sucesso' then is_mensagem_sucesso?
      when 'erro'    then is_mensagem_erro?
    end
  end

  def conteudo_da_mensagem_de_alerta
    selector_mensagem = "#{create_selector_container_mensagem}.getElement(\"li\").innerHTML"
    @driver.execute_script("return #{selector_mensagem}")
  end

  def contains? mensagem
    conteudo_da_mensagem_de_alerta.include? mensagem
  end

  def is_mensagem_visible?
    selector_visibility = "#{create_selector_container_mensagem}.isVisible()"
    @driver.execute_script("return #{selector_visibility}")
  end

  def is_mensagem_sucesso?
    is_mensagem_de_erro? false
  end

  def is_mensagem_erro?
    is_mensagem_de_erro? true
  end

  def is_mensagem_de_erro? bool
    selector = "#{create_selector_container_mensagem}.hasClass('application_messages_container_#{bool}')"
    @driver.execute_script("return #{selector}")
  end
