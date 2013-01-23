# language: pt

Quando /^eu alterar o (date chooser|campo de data) "([^"]*)" para "([^"]*)"$/ do |type,toolTip,string_data|
   Melomel::Cucumber.run! do
      classes = get_component_classes( type )
      campo_data = Melomel.find!(classes, :toolTip => toolTip )
      string_data = converter_data( string_data )
      campo_data.setFocus()
      campo_data.selectedDate = Melomel::Date.parse(string_data)
   end
end

Entao /^o (date chooser|campo de data) "([^"]*)" deve estar vazio$/ do |type,toolTip|
   Melomel::Cucumber.run! do
      classes = get_component_classes( type )
      campo_data = Melomel.find!(classes, :toolTip => toolTip )
      campo_data.setFocus()
      campo_data.text.should == ''
   end
end

Dado /^vazio o (date chooser|campo de data) "([^"]*)"$/ do |type,toolTip|
   Melomel::Cucumber.run! do
      classes = get_component_classes( type )
      campo_data = Melomel.find!(classes, :toolTip => toolTip )
      campo_data.setFocus()
      campo_data.text.should == ''
   end
end

