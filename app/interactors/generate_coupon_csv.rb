require 'csv'

class GenerateCouponCsv
  include Interactor

  def call
    coupons = Coupon.ordered.includes(:products)
    context.csv_data = CSV.generate(headers: true) do |csv|
      csv << %w[ID Name Value Accosiated_Products]

      coupons.each do |coupon|
        product_names = coupon.products.pluck(:title).join(', ')
        csv << [coupon.id, coupon.name, coupon.value, product_names]
      end
    end
  end
end
