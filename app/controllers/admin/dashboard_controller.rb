class Admin::DashboardController < AdminController

  def index
    authorize :dashboard, :index?
    # Admin dashboard logic goes here
  end
end
