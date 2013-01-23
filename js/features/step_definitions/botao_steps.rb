# language: pt

Quando /^eu abrir o modulo "([^"]*)"$/ do |name|
   Melomel::Cucumber.run! do
      classes = get_component_classes( 'modulo' )
      button = Melomel::Cucumber.find_by_label!(classes, name)
      button.setFocus()
      Melomel.click(button)
   end
end


Quando /^eu clicar no (botao|check box|radio button|tab) "([^"]*)"$/ do |type,toolTip|
   Melomel::Cucumber.run! do
      classes = get_component_classes( type )
      button = Melomel.find!(classes, :toolTip => toolTip )
      button.setFocus()
      Melomel.click(button)
   end
end

Dado /^um clique no (botao|check box|radio button|tab) "([^"]*)"$/ do |type,toolTip|
   Melomel::Cucumber.run! do
      classes = get_component_classes( type )
      button = Melomel.find!(classes, :toolTip => toolTip )
      button.setFocus()
      Melomel.click(button)
   end
end
