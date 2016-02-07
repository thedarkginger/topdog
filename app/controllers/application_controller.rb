class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_category
  before_action :set_topic

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:city, :username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:city, :login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:city, :username, :email, :password, :password_confirmation, :current_password) }
  end

  def set_category
    session[:category] = params[:category] if params[:category].present?
  end

  def set_topic
    session[:topic] = params[:topic] if params[:topic].present?
  end

end
