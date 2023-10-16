class CreateCart < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :quantity
      t.integer :totalPrice
      t.references :user
    end
  end
end
