When /^Eu type "([^"]*)" in the "([^"]*)" text field$/ do |text,textInput|
  ti = Melomel.find('spark.components.TextInput', :label => textInput)
  ti.text.should == textInput
end

When /^Eu click the "([^"]*)" button$/ do |label|
  button = Melomel.find('spark.components.Button', :label => label)
  button.should_not be_nil
  Melomel.click(button)
end

Then /^O display should show "([^"]*)"$/ do |text|
  display = Melomel.find('spark.components.TextInput', :id => 'display')
  display.text.should == text
end

