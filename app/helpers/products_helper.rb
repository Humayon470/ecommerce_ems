# frozen_string_literal: true

module ProductsHelper
  def updated_products
    Product.ordered
  end

  def product_select
    Product.ordered.map { |product| [product.title.capitalize, product.id] }
  end
end
