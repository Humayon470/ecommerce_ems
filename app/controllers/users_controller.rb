class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    authorize :user, :index?
    @pagy, @users = pagy(User.search(params[:search]).sort_by_column(sort_column, sort_direction), items: 5)
  end

  private

  def sort_column
    # Determine the column to sort by, e.g., from params
    params[:sort] || "id"
  end

  def sort_direction
    # Determine the sorting direction, e.g., from params
    params[:direction] || "asc"
  end
end
