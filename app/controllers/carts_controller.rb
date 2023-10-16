class CartsController < ApplicationController
  before_action :current_cart, only: [:show, :add_to_cart, :destroy, :edit, :update]
  before_action :find_product, only: [:add_to_cart, :destroy]

  def index; end

  def show
    @products = @cart.products

    @total_price = Cart.calculate_total(@cart)
  end

  def add_to_cart

    if @cart.products.include?(@product)
      redirect_to homepage_index_path, notice: 'Product is already in the cart.'
    else
      @cart.products << @product
      redirect_to homepage_index_path, notice: 'Product added to cart successfully.'
    end
  end

  def edit
    @result = CartService.new(@cart).call
  end

  def update
    if @cart.update(cart_params.merge!(user_id: nil))
      redirect_to homepage_index_path, notice: 'Order is placed'
    else
      redirect_to cart_path
    end
  end

  def destroy

    if @cart
      @cart.products.delete(@product)
      redirect_to cart_path, notice: 'Product removed from cart successfully.'
    else
      redirect_to cart_path, alert: 'Cart not found.'
    end
  end

  private

  def current_cart
    @cart = Cart.user_cart(current_user)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def cart_params
    params.require(:cart).permit(:totalPrice, :name, :address, :phone, :payment)
  end
end
