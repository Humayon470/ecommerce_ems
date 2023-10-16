class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource

    respond_to do |format|
      format.js
    end
  end
end
