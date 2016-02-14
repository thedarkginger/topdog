class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_category
  before_action :set_topic
  before_filter :set_timezone

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:city, :username, :timezone, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:city, :login, :timezone, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:city, :username, :timezone, :email, :password, :password_confirmation, :current_password) }
  end

  def set_category
    session[:category] = params[:category] if params[:category].present?
  end

  def set_topic
    session[:topic] = params[:topic] if params[:topic].present?
  end

  private

  def set_timezone
    tz = current_user ? current_user.timezone : nil
    Time.zone = tz || ActiveSupport::TimeZone["London"]
  end

end
