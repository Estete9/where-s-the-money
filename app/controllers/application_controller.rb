class ApplicationController < ActionController::Base
  before_action :redirect_unauthenticated_users, unless: :allowed_path?
  before_action :authenticate_user!

  private

  def allowed_path?
    (controller_name == 'pages' && action_name == 'splash') ||
      (devise_controller? && (controller_name == 'registrations' || controller_name == 'sessions'))
  end

  def redirect_unauthenticated_users
    redirect_to splash_path unless user_signed_in?
  end

  def after_sign_in_path_for(_resource)
    root_path # Redirect to categories index after sign in
  end

  def after_sign_out_path_for(_resource_or_scope)
    splash_path # Redirect to splash screen after sign out
  end
end
