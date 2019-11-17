class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?



  # # 例外処理
  # rescue_from ActiveRecord::RecordNotFound, with: :render_404

  # def render_404
  #   render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  # end

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  # def after_sign_out_path_for(resource)
  #   home_path
  # end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :email, :password, :password_confirmation])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  # private
  # def after_sign_in_path_for(resource)
  #   user_path(resource)
  # end

  # def after_sign_out_path_for(resource)
  #   home_path
  # end
end
