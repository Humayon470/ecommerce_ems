class RemoveColumnFromCart < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :quantity
  end
end
