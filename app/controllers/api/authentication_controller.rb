class Api::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def login
    @user = User.find_by_email(login_params[:email])
    if @user&.valid_password?(login_params[:password])
      token = jwt_encode(user_id: @user.id)
      respond_to do |format|
        msg = { status: 'ok', token: }
        format.json { render json: msg } # don't do msg.to_json
      end
    else
      respond_to do |format|
        msg = { status: 'fail', error: 'Error' }
        format.json { render json: msg } # don't do msg.to_json
      end
    end
  end

  def create
    @user = User.new(user_params.merge(posts_counter: 0))
    if @user.save
      respond_to do |format|
        msg = { status: 'ok', message: 'account created' }
        format.json { render json: msg } # don't do msg.to_json
      end
    else
      respond_to do |format|
        msg = { status: 'error' }
        format.json { render json: msg } # don't do msg.to_json
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio)
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
