class Admin::ProductsController < AdminController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @products = pagy(Product.search(params[:search], params[:sort], params[:direction]), items:5)

  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
  
    if @product.save
      redirect_to admin_products_path, notice: 'Product has been created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Product has been updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
  end

  def export_csv
    result = GenerateProductCsv.call

    respond_to do |format|
      format.csv do
        send_data result.csv_data, filename: "products.csv"
      end
    end
  end


  private

  def product_params
    params.require(:product).permit(:title, :price, :description, :status, :product_img, :category_id)
  end

  def find_product
    @product= Product.find(params[:id])
  end
end
