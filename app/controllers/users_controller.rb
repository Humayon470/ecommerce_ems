class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    authorize :user, :index?
    @pagy, @users = pagy(User.all.where(role: 'users'), items: 5)
  end

  def search
    @search_query = params[:search]
    @users = User.where(id: @search_query).or(User.where(name: @search_query)).or(User.where(email: @search_query))
  end
end
