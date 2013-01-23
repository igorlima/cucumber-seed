# language: pt
# encoding: utf-8

Dado /^o sistema logado com o usuario "([a-zA-Z1-9]*)" e com a senha "([a-zA-Z1-9]*)"$/ do |username, password|
  input_username = @driver.execute_script("return document.querySelector(\"input[name='josso_username']\")")
  input_password = @driver.execute_script("return document.querySelector(\"input[name='josso_password']\")")
  btn_login = @driver.execute_script("return document.querySelector(\"input[value='Login']\")")

  input_username.send_keys username
  input_password.send_keys password

  @driver.action.
          click(btn_login).
          perform

  message_error = @driver.execute_script("return document.querySelector(\".message.error\")")
  fail(ArgumentError.new('Usuario nao autenticado!')) if not message_error.nil?

end
