class Users::SessionsController < Devise::SessionsController
  after_filter :set_csrf_header, only: [:new, :create]

  protect_from_forgery except: [:create]



  def create
    super
    # response.headers['X-Csrf-Token'] = form_authenticity_token
  end



  protected

  # set
  def set_csrf_header
    # puts form_authenticity_token
    response.headers['X-Csrf-Token'] = form_authenticity_token
  end


end
