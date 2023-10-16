class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    authorize :user, :index?
    @pagy, @users = pagy(User.all.where(role: 'users'), items: 5)
  end
end
