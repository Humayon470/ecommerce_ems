module CouponsHelper
  def updated_coupons
    Coupon.ordered
  end

  def coupon_products
    @coupon.products.ordered.map { |product| product.title.capitalize }.join(', ')
  end
end
