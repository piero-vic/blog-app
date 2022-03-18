class Api::UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    render json: User.all.order(created_at: :asc)
  end

  def show
    render json: User.find(params[:id])
  end
end
