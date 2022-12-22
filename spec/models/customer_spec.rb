require 'rails_helper'

RSpec.describe Customer, :type => :model do

  describe 'Associations' do
    it { should have_one(:address) }
  end
  describe 'Validations' do
    subject {
      described_class.new(zip_code: '01001010',
                          name: 'ANTONIO')
    }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a zip_code' do
      subject.zip_code = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if zip_code length is not 8' do
      subject.zip_code = '1234'
      expect(subject).to_not be_valid
    end

    it 'is not valid if zip_code is not numeric only' do
      subject.zip_code = '1234ldk3'
      expect(subject).to_not be_valid
    end
  end
end
