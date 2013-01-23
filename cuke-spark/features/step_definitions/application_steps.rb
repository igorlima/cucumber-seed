When /^I click the "([^"]*)" button$/ do |label|
  button = Melomel.find('spark.components.Button', :label => label)
  button.should_not be_nil
  Melomel.click(button)
end

Then /^the display should show "([^"]*)"$/ do |text|
  display = Melomel.find('spark.components.TextInput', :id => 'display')
  display.text.should == text
end

Then /^how to invoke a method$/ do ||
  #Loop pra tempo
  for i in 0..15
     Melomel.wait()
  end
  
  obj = Melomel.create_object( 'Number' )
  obj = 5
  classes = Melomel.get_class( 'spark.components.Application' )
  app = Melomel.find(classes, :name => 'Calculator!')
  #o comando 'puts' eh para imprimir o retorno do metodo
  puts app.invoke_method( 'test', '3', obj )
  puts app
end
