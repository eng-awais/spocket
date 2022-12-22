class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :zip_code, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
