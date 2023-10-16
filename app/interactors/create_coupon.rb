class CreateCoupon
  include Interactor

  def call
    @coupon = Coupon.new(context.coupon_params.except(:product_ids))

    if @coupon.save
      update_products_with_coupon
      context.coupon = @coupon
    else
      context.fail!(coupon: @coupon)
    end
  end

  private

  def update_products_with_coupon
    product_ids = context.coupon_params[:product_ids]
    Product.where(id: product_ids).update_all(coupon_id: @coupon.id)
  end
end
