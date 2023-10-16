class Cart < ApplicationRecord
  has_many :productscarts
  has_many :products, through: :productscarts
  belongs_to :user, optional: true

  enum payment: {
    cash_on_delivery: 0,
    pay_with_card: 1
  }

  def self.user_cart(user)
    find_or_create_by(user: user)
  end

  def self.calculate_total(cart)
    total_price = cart.products.sum(:price)
    cart.update(totalPrice: total_price)
    total_price
  end
end