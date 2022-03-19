class Api::UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    render json: User.all.order(created_at: :asc)
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: 'Account created successfully', auth_token: auth_token }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :bio,
      :photo,
      :password
    )
  end
end
