class UsersController < ApplicationController
  def index
    @users = User.all.where(role: 'users')
    respond_to do |format|
      format.js
    end
  end
end
