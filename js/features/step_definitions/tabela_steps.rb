# language: pt

Quando /^existir elemento na tabela "([^"]*)"$/ do |nome_tabela|
  Melomel::Cucumber.run! do
    classes = get_component_classes('data grid')
    grid = Melomel::Cucumber.find_labeled!(classes, nome_tabela)
    grid.setFocus()

    # Retrieve data and take off header row
    data = Melomel::Cucumber.get_grid_data(grid)[1..-1]
  
    # If we couldn't find a matching cell then throw an error
    if( data.length == 0 )
      raise "Nao existe elemento na tabela" 
    end
  
  end
end

Entao /^deve existir elemento na tabela "([^"]*)"$/ do |nome_tabela|
  Melomel::Cucumber.run! do
    classes = get_component_classes('data grid')
    grid = Melomel::Cucumber.find_labeled!(classes, nome_tabela)
    grid.setFocus()
    

    # Retrieve data and take off header row
    data = Melomel::Cucumber.get_grid_data(grid)[1..-1]
  
    # If we couldn't find a matching cell then throw an error
    if( data.length == 0 )
      raise "Nao existe elemento na tabela" 
    end
  
  end
end

Entao /^eu preciso ver o item "([^"]*)" na tabela "([^"]*)"$/ do |value, nome_tabela|
  Melomel::Cucumber.run! do
    classes = get_component_classes('data grid')
    grid = Melomel::Cucumber.find_labeled!(classes, nome_tabela)
    grid.setFocus()
    

    # Retrieve data and take off header row
    data = Melomel::Cucumber.get_grid_data(grid)[1..-1]
  
    # Loop data and check for matches
    index = nil
    data.each_index do |i|
      row = data[i]
      row.each do |cell|
        if (cell != nil) && (cell.strip == value)
          index = i
          break
        end
      end
    
      break unless index.nil?
    end
  
    raise "Nao foi possivel encontrar '#{value}' na tabela" if index.nil?
       
  end
end




Quando /^eu selecionar "([^"]*)" na tabela "([^"]*)" clicando o botao "([^"]*)"$/ do |value, nome_tabela, nome_botao|
  Melomel::Cucumber.run! do
    classes = get_component_classes('data grid')
    grid = Melomel::Cucumber.find_labeled!(classes, nome_tabela)
    grid.setFocus()
    

    # Retrieve data and take off header row
    data = Melomel::Cucumber.get_grid_data(grid)[1..-1]
  
    # Loop data and check for matches
    index = nil
    data.each_index do |i|
      row = data[i]
      row.each do |cell|
        if (cell != nil) && (cell.strip == value)
          index = i
          break
        end
      end
    
      break unless index.nil?
    end
  
    # If we couldn't find a matching cell then throw an error
    raise "Nao foi possivel encontrar o elemento '#{value}' na tabela" if index.nil?
  
    grid.selectedIndex = index 
    
    botoes_do_grid = Melomel.find_all!( get_component_classes('imagem'), :toolTip => nome_botao ).reverse
    #botoes_do_grid = botoes_do_grid.reverse
    
    
    botoes_do_grid[index].setFocus()
    Melomel.click(botoes_do_grid[index])
    
  end
end

