class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    authorize :user, :index?
    @pagy, @users = pagy(User.search(params[:search]), items: 5)
  end
end
