class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_game_id
  before_action :set_topic
  before_filter :set_timezone
  before_filter :set_example

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:city, :username, :timezone, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:city, :login, :timezone, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:city, :username, :timezone, :email, :password, :password_confirmation, :current_password) }
  end

  def after_sign_in_path_for(resource)
  root_path
end

 def after_sign_up_path_for(resource)
  root_path
end

  def set_game_id
    session[:game_id] = params[:game_id] if params[:game_id].present?
  end

  def set_topic
    session[:topic] = params[:topic] if params[:topic].present?
  end

  def set_example

    if user_signed_in? 
      @userstacks = Stack.where(user_id: current_user.id)
      @usertotal = @userstacks.sum(:chips)
      @userfinal = @usertotal.to_s
      @example = 'Wallet: ' + "$" + @userfinal
  end
end 

  private

  def set_timezone
    tz = current_user ? current_user.timezone : nil
    Time.zone = tz || ActiveSupport::TimeZone["London"]
  end

end
