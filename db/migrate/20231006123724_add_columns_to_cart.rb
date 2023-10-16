class AddColumnsToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :coupons, :string
    add_column :carts, :amount, :float
  end
end
