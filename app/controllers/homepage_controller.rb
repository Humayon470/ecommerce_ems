class HomepageController < ApplicationController
  before_action :find_product, only: [:show]

  def index
    @pagy, @products = pagy(Product.product_show, items: 8)
    @cart = Cart.user_cart(current_user)
  end

  def show; end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
