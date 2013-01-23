# language: pt

Entao /^eu preciso ver alguma popup$/ do ||
   Melomel::Cucumber.run! do
      classes = get_component_classes( 'popup' )
      Melomel.find!(classes)
   end
end

