module ProductsHelper
  def products
    Product.ordered
  end
end