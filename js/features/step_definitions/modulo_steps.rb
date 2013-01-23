# language: pt

Dado /^o modulo "([^"]*)" aberto$/ do |name|
   Melomel::Cucumber.run! do
      classes = get_component_classes( 'botao modulo' )
      button = Melomel::Cucumber.find_by_label!(classes, name)
      button.setFocus()
      Melomel.click(button)
      
      esperar_carregar_o_modulo
      
   end
end

Dado /^o menu principal aberto$/ do ||
   Melomel::Cucumber.run! do
      mostrar_menu
      sleep 1
   end
end

Dado /^o menu principal fechado$/ do ||
   Melomel::Cucumber.run! do
      esconder_menu
   end
end

Dado /^o item "([^"]*)" no menu selecionado$/ do |name|
   Melomel::Cucumber.run! do
      on_click_menu( name )
      sleep 1
   end
end
