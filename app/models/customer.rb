class Customer < ApplicationRecord
  has_one :address

  validates :name, presence:true
  validates :zip_code, presence:true, numericality: { only_integer: true }
  validates_format_of :zip_code, :with => /\d{8}/
end
