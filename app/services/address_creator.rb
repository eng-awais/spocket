# app/services/address_creator.rb
class AddressCreator < ApplicationService
  attr_reader :customer, :address_attributes
  ADD_ATTRIBUTES = %i[public_place complement  district locality state ibge gia area_code siafi]

  def initialize(customer, address_attributes)
    @customer = customer
    @address_attributes = address_attributes
  end

  def call
    customer.create_address(filtered_attributes) if filtered_attributes
  end

  private

  def filtered_attributes
    I18n.locale ='en'
    parsed_attributes = JSON.parse(address_attributes)
    filtered_attributes = parsed_attributes.select { |key, val| ADD_ATTRIBUTES.include?((I18n.t key).to_sym) }
    filtered_attributes.map { |key, val| [key_map(key), val] }.to_h

  end

  def key_map(key)
    (I18n.t key).to_sym
  end
end

