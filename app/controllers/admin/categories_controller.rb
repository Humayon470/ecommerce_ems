class Admin::CategoriesController < AdminController
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.ordered
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    debugger
    @category = Category.new(category_params)
  
    if @category.save
      redirect_to admin_categories_path, notice: 'Category has been created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Category has been updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:name, :availability)
  end

  def find_category
    @category = Category.find(params[:id])
  end

end