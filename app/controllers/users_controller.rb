require 'csv'
class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @pagy, @users = pagy(User.search(params[:search]).sort_by_column(sort_column, sort_direction), items: 5)
    authorize @users
  end

  def export_csv
    @users = User.search(params[:search]).sort_by_column(sort_column, sort_direction)
  
    respond_to do |format|
      format.csv do
        send_data generate_csv(@users), filename: "users.csv"
      end
    end
  end

  def destroy
    @user= User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end
  
  def show
    @user= User.find(params[:id])
  end

  private

  def generate_csv(users)
    CSV.generate(headers: true) do |csv|
      csv << ["ID", "Name", "Email", "Role"]
  
      users.each do |user|
        csv << [user.id, user.name, user.email, user.role]
      end
    end
  end

  def sort_column
    params[:sort] || "id"
  end

  def sort_direction
    params[:direction] || "asc"
  end
end
