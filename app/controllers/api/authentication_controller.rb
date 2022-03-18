class Api::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    @user = User.find_by_email(login_params[:email])
    if @user&.valid_password?(login_params[:password])
      token = jwt_encode(user_id: @user.id)
      respond_to do |format|
        msg = { status: 'ok', token: token }
        format.json { render json: msg } # don't do msg.to_json
      end
    else
      respond_to do |format|
        msg = { status: 'fail', error: "Error" }
        format.json { render json: msg } # don't do msg.to_json
      end
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
