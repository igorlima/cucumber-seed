# language: pt

# converter a data no formato ingles para o formato portugues
# converter_data( 01/30/2011 ) vai retornar "30/01/2011"
def converter_data(string_data)
   string_data = string_data[3]+string_data[4]+string_data[2]+string_data[0]+string_data[1]+string_data[5]+string_data[6]+string_data[7]+string_data[8]+string_data[9]
end


def esperar_carregar_o_modulo
   desktop = get_desktop
   carregando = desktop.invoke_method( 'carregandoModulo' )
   
   while carregando
      for i in 0..5
         sleep 0.1
      end
      carregando = desktop.invoke_method( 'carregandoModulo' )
   end
end

def get_desktop
   classes = get_component_classes( 'app' )
   app = Melomel.find(classes)
   desktop = app.invoke_method( 'getDesktop' )
   
   return desktop
end

def get_menu
   desktop = get_desktop
   return desktop.menu
end

def mostrar_menu
   menu = get_menu
   
   booleano = Melomel.create_object( 'Boolean' )
   booleano = true
   
   menu.invoke_method( 'updateShowing', booleano )
   
end

def esconder_menu
   menu = get_menu
   
   booleano = Melomel.create_object( 'Boolean' )
   booleano = false
   
   menu.invoke_method( 'updateShowing', booleano )
   
end

def on_click_menu( name )
   menu = get_menu
   str_name = Melomel.create_object( 'String' )
   str_name = name
   menu.invoke_method( 'onClickMenu', str_name )
end
