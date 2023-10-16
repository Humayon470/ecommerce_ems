class AddAvailabilityColumnToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :availability, :integer
  end
end
