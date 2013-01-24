# language: pt
# encoding: utf-8

Entao /^deve aparecer a mensagem de (sucesso|erro) "([^\"]*)"$/ do |tipo_da_mensagem, mensagem|
  verify_mensagem tipo_da_mensagem, mensagem
end

E /^aparecer a mensagem de (sucesso|erro) "([^\"]*)"$/ do |tipo_da_mensagem, mensagem|
  verify_mensagem tipo_da_mensagem, mensagem
end

private

  def verify_mensagem tipo_da_mensagem, mensagem
    fail(ArgumentError.new('Mensagem de alerta nao esta visivel!')) unless is_mensagem_visible?
    fail(ArgumentError.new("Mensagem de alerta nao eh de #{tipo_da_mensagem}!")) unless is? tipo_da_mensagem
    fail(ArgumentError.new("A mensagem nao possui o conteudo: #{mensagem}!")) unless contains? mensagem
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

  def contains? mensagem
    selector_mensagem = "#{create_selector_container_mensagem}.getElement(\":contains('#{mensagem}')\")"
    element_mensagem = @driver.execute_script("return #{selector_mensagem}")
    not element_mensagem.nil?
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
