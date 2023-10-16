class ApplicationController < ActionController::Base
     include Pagy::Backend
     include Pundit
     rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
   
     private
   
     def user_not_authorized
       flash[:alert] = "You are not authorized to perform this action."
       redirect_to(request.referer || root_path)
     end
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

       def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
       end

end
