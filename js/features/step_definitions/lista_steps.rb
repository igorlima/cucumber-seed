# language: pt

Quando /^eu selecionar "([^"]*)" no (combo box|lista) "([^"]*)"$/ do |string_item,type,toolTip|
   Melomel::Cucumber.run! do
      classes = get_component_classes( type )
      list = Melomel.find!(classes, :toolTip => toolTip )
      list.setFocus()
      
      labels = Melomel.items_to_labels!(list, list.dataProvider)
      
      #Loop
      index = nil
      labels.length.times do |i|
         if labels[i] == string_item
            index = i
         end
      end
      raise "Nao foi possivel encontrar '#{string_item}' no #{type}" if index.nil?
      
      list.selectedIndex = index
   end
end

Dado /^vazio o (combo box|lista) "([^"]*)"$/ do |type,toolTip|
   Melomel::Cucumber.run! do
      classes = get_component_classes( type )
      list = Melomel.find!(classes, :toolTip => toolTip )
      list.setFocus()
      list.selectedIndex.should == -1
   end
end


Dado /^a selecao "([^"]*)" no (combo box|lista) "([^"]*)"$/ do |string_item,type,toolTip|
   Melomel::Cucumber.run! do
      classes = get_component_classes( type )
      list = Melomel.find!(classes, :toolTip => toolTip )
      list.setFocus()
      
      labels = Melomel.items_to_labels!(list, list.dataProvider)
      
      #Loop
      index = nil
      labels.length.times do |i|
         if labels[i] == string_item
            index = i
         end
      end
      raise "Nao foi possivel encontrar '#{string_item}' no #{type}" if index.nil?
      
      list.selectedIndex = index
   end
end

Entao /^o (combo box|lista) "([^"]*)" deve estar vazio$/ do |type,toolTip|
   Melomel::Cucumber.run! do
      classes = get_component_classes( type )
      list = Melomel.find!(classes, :toolTip => toolTip )
      list.setFocus()
      list.selectedIndex.should == -1
   end
end


