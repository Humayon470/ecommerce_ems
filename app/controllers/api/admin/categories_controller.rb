class Api::Admin::CategoriesController < ::Admin::CategoriesController
  skip_before_action :verify_authenticity_token
end