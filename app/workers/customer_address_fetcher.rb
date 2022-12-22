# frozen_string_literal: true

class CustomerAddressFetcher
  include Sidekiq::Worker
  queue_as :default

  def perform(customer_zip_code, customer_id)
    response_address = ViacepHandler.call(customer_zip_code)
    customer = Customer.find_by(id: customer_id)
    AddressCreator.call(customer, response_address.body)
  end
end
