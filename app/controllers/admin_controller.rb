class AdminController < ApplicationController
  before_action :authorize_admin
  layout 'admin'

  private

  def authorize_admin
    authorize :admin, policy_class: AdminPolicy
  end

  def pundit_user
    current_user
  end
end
