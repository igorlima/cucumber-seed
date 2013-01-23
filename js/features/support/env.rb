require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'cucumber'
require 'melomel/cucumber'
require 'selenium-webdriver'
require 'melomel'

Before do |scenario|
  @driver = Selenium::WebDriver.for :firefox
  @driver.navigate.to "http://j.ti.lemaf.ufla.br/Outorga/index.jsp?login=1&aplicacao=mbov&codpessoa=303601&codempreendimento=246&codcaracterizacao=13&codusuario=1"
end

After do |scenario|
  @driver.quit() unless @driver.nil?
end
