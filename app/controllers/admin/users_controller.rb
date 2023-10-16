class Admin::UsersController < AdminController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @users = pagy(User.search(params[:search], params[:sort], params[:direction]), items: 5)

    authorize @users
  end
  
  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_users_url, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    if @user.destroy
      flash[:notice] = "User has been sucessfully deleted."
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
    end

    redirect_to admin_users_url
  end

  def export_csv
    result = GenerateUserCsv.call(users: User.user.ordered)

    respond_to do |format|
      format.csv do
        send_data result.csv_data, filename: "users.csv"
      end
    end
  end

  private

  def find_user
    @user= User.find(params[:id])
  end

  def authorize_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end
end