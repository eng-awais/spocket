class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :public_place
      t.string :complement
      t.string :district
      t.string :locality
      t.string :state
      t.integer :ibge
      t.integer :gia
      t.integer :area_code
      t.integer :siafi
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
