class UpdateCoupon
  include Interactor

  def call
    @coupon = Coupon.find(context.id)
    previous_products = @coupon.products.to_a
    if @coupon.update(context.coupon_params.except(:product_ids))
      update_products_with_coupon(previous_products)
      context.coupon = @coupon
    else
      context.fail!(message: @coupon.errors.full_messages.join(', '))
    end
  end

  private

  def update_products_with_coupon(previous_products)
    product_ids = context.coupon_params[:product_ids]
    products_to_update = Product.where(id: product_ids)

    arr = []
    previous_products.each do |product|
      arr << product.id unless products_to_update.include?(product)
    end

    Product.where(id: arr).update_all(coupon_id: nil)

    products_to_update.update_all(coupon_id: @coupon.id)
  end
end
  