class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_filter :set_locale

  def set_locale
  # 可以將 ["en", "zh-TW"] 設定為 VALID_LANG 放到 config/environment.rb 中
  if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
  end
    I18n.locale = session[:locale] || I18n.default_locale
  end


  # show blob image
  # params => model_name, id
  def show_image
    if not params[:model].nil? and not params[:id].nil?
      @object = params[:model].singularize.classify.constantize.find(params[:id])
      send_data @object.image, :type => 'image/jpg', :disposition => 'inline' if not @object.nil?
    end
  end


  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email ,:password, :password_confirmation, :phone, :address) }
  end

  # module ActiveAdmin
  #   class Product  < ActiveRecord::Base
  #     after_create :send_email
  #     def send_email
  #       print 'after create!!!!!!!!!'
  #       Notifier.new_released(product).deliver
  #     end
  #   end
  # end

end
