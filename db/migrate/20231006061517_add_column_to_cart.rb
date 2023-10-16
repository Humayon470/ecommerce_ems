class AddColumnToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :name, :string
    add_column :carts, :address, :string
    add_column :carts, :phone, :string
    add_column :carts, :payment, :integer
  end
end
