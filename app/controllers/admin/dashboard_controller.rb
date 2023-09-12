class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # Admin dashboard logic goes here
  end
end
