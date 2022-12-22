require 'rails_helper'

RSpec.describe Api::V1::Bulk::CustomerController, type: :controller do

  before(:all) { Sidekiq::Worker.drain_all}

  describe '#create' do
    context 'with valid params' do
      let(:params) {
                      [{
                        "cep": "01001000",
                        "name": "JOSE"
                    },
                    {
                        "cep": "01001001",
                        "name": "JOAO"
                    },
                    {
                        "cep": "01001010",
                        "name": "ANTONIO"
                    }]
       }

    let!(:prev_customer_count) { Customer.count }

      it "will trigger bulk creation of customers and create sidekiq job" do
        post :create, params: {_json: params} #, headers: headers
        expect(Customer.count).to eq(prev_customer_count+3)
        expect(CustomerAddressFetcher.jobs.size).to eq(3)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      let(:params) {
                      [{
                        "cep": "0hyt01000",
                        "name": "JOSE"
                    },
                    {
                        "cep": "3456",
                        "name": "JOAO"
                    }]
       }

    let!(:prev_customer_count) { Customer.count }

      it "will  nottrigger bulk creation of customers and return unprocessable entity" do
        post :create, params: {_json: params} #, headers: headers
        expect(Customer.count).to eq(prev_customer_count)
        expect(response).to have_http_status(422)
      end
    end
  end
end
