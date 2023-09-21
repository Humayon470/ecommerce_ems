class InvitationsController < Devise::InvitationsController
  before_action :configure_accept_invitaion_parameters, only: [:update]

  private

  def configure_accept_invitaion_parameters
    devise_parameter_sanitizer.permit(:accept_invitation) { |u| u.permit(:name, :password, :password_confirmation, :invitation_token, :email) }
  end
end