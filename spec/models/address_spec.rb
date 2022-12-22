require 'rails_helper'

RSpec.describe Address, :type => :model do

  let(:customer) { Customer.create(zip_code: '01001010', name: 'ANTONIO') }

  describe "Associations" do
    it { should belong_to(:customer) }
  end

  describe 'validations' do
    subject { described_class.new(public_place: 'Praça da Sé',
                                  complement: 'lado pa',
                                  district: 'Sé',
                                  locality: 'São Paulo',
                                  state: 'SP',
                                  ibge: 3550308,
                                  gia: 1004,
                                  area_code: 11,
                                  siafi: 7107)
    }
    it 'is not valid without customer' do
      expect(subject).not_to be_valid
    end

    it 'is valid with customer' do
      subject.customer = customer
      expect(subject).to be_valid
    end

  end

end
