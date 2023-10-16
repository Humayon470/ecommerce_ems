class AddCouponToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :coupon, null: true
  end
end
