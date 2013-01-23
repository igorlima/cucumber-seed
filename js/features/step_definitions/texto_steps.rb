# language: pt

Quando /^eu digitar "([^"]*)" no (campo de texto|area de texto) "([^"]*)"$/ do |text, type, name|
  Melomel::Cucumber.run! do
    classes = Melomel::Flex.get_component_classes(type)
    component = Melomel.find!(classes, :toolTip => name )
    component.setFocus()
    component.text = text
  end
end

Entao /^eu preciso ver "([^"]*)" no (campo de texto|area de texto) "([^"]*)"$/ do |text, type, name|
  Melomel::Cucumber.run! do
    classes = Melomel::Flex.get_component_classes(type)
    component = Melomel.find!(classes, :toolTip => name )
    component.setFocus()
    component.text.should == text
  end
end

Entao /^o (campo de texto|area de texto) "([^"]*)" deve estar vazio$/ do |type, name|
  Melomel::Cucumber.run! do
    classes = Melomel::Flex.get_component_classes(type)
    component = Melomel.find!(classes, :toolTip => name )
    component.setFocus()
    component.text.should == ''
  end
end


Entao /^eu nao preciso ver "([^"]*)" no (campo de texto|area de texto) "([^"]*)"$/ do |text, type, name|
  Melomel::Cucumber.run! do
    classes = Melomel::Flex.get_component_classes(type)
    component = Melomel.find!(classes, :toolTip => name )
    component.setFocus()
    component.text.should_not == text
  end
end

