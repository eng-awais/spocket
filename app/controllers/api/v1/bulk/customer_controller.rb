class Api::V1::Bulk::CustomerController < ApplicationController
  def create
    created_customers = customer_params.map do |customer_param|
      customer = Customer.new(zip_code: customer_param[:cep], name: customer_param[:name],)
      CustomerAddressFetcher.perform_async(customer.zip_code, customer.id ) if customer.save
    end

    if created_customers.any?
      render json: {}, status: :ok
    else
      render json: {}, status: 422
    end
  end

  private

  def customer_params
    params.permit(_json: %i[cep name]).require(:_json)
  end

end
