class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    authorize :user, :index?
    @users = User.all.where(role: 'users')
    respond_to do |format|
      format.js
    end
  end
end
