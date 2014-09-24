class Api::V1::TokensController < ApplicationController
  respond_to :json

  def create
    @users = User.all
    email = params[:email]
    password = params[:password]

    if email.nil? or password.nil?
      return render :status => 400, :json => { :message => "reqeust must contain 'email' and 'password'" }
    end

    @user = User.find_by_email(email.downcase)

    if @user.nil?
      return render :status => 401, :json => { :message => "email error" }
    end

    @user.ensure_authentication_token!

    if not @user.valid_password?(password)
      render :status => 401, :json => { :message => "Invalid email or password." }
    else
      render :status => 200, :json => { :token => @user.authentication_token }
    end

  end


  def destroy

  end

end
