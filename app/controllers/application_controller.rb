class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  # Assignment 37 ///////////////////////////

  # before_action :flash_attack

  # def flash_attack
  #   flash[:notice] = "Attack of the flash!"
  # end

  # ////////////////////////////////////////

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
