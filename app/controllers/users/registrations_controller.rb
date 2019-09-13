# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_params, only: [:create]

  protected

  def configure_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday, :role_id])
  end

  def after_sign_up_path_for(resource)
    super(resource)
  end

  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
