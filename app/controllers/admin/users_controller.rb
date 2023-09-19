require 'csv'
class Admin::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @users = pagy(User.search(params[:search]).sort_by_column(sort_column, sort_direction), items: 5)
    authorize @users
  end
  
  def show
    @user= User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    authorize @user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_url, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @user= User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url
  end

  def export_csv
    @users = User.search(params[:search]).sort_by_column(sort_column, sort_direction)
  
    respond_to do |format|
      format.csv do
        send_data generate_csv(@users), filename: "users.csv"
      end
    end
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

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end
end