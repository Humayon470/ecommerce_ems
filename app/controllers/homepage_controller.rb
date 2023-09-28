class HomepageController < ApplicationController
  before_action :find_product, only: [:show]

  def index
    @pagy, @products = pagy(Product.product_show, items: 8)
  end

  def show; end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
