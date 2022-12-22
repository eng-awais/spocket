# app/services/viacep_handlr.rb
class ViacepHandler < ApplicationService
  attr_reader :zip_code
  BASE_URL = 'https://viacep.com.br/ws/'
  
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def call
    RestClient.get BASE_URL + zip_code + '/json/'
  end
end
