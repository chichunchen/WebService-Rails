class Api::V1::UsersController < ApplicationController
  before_action :authenticate_with_token!, only: [:update, :destroy]
  respond_to :json

  def show
    respond_with User.find(params[:id])
  end

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

  # current_user is hacked in concerns/authenticate
  def update
    user = current_user

    if user.update(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end


	def destroy
    current_user.destroy
    head 204
  end

	private

  def user_params
    params.require(:user).permit(:name, :address, :phone, :email, :password, :password_confirmation)
  end
end
