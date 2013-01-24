
E /^aguardar ([0-9]+) segundos para carregar a pagina$/ do |segundos|
  sleep segundos.to_i
end