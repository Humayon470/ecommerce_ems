class CartService
  attr_accessor :cart

  def initialize(cart)
    @cart = cart
  end

  def call
    cart_product_ids = cart.products.pluck(:coupon_id)
    discount = Coupon.where(id: cart_product_ids)
    coupons= discount.pluck(:name)
    coupontotal = discount.sum(:value)
    amount = cart.totalPrice - coupontotal.to_i + 150
    cart.update(coupons: coupons.join(', '), amount: amount)
    { coupons: coupons, coupontotal: coupontotal }
  end
end