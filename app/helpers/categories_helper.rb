module CategoriesHelper
  def categories
    Category.ordered
  end
end