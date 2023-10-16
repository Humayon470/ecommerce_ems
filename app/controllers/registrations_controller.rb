class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]
  before_action :configure_account_update_parameters, only: [:update]

  def new
    build_resource

    respond_to do |format|
      format.js
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
  end

  def configure_account_update_parameters
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password)}
  end

end
