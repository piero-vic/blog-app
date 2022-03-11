class UsersController < ApplicationController
  def index
    @current_user = current_user
    @users = User.all.order(created_at: :asc)
  end

  def show
    @current_user = current_user
    @user = User.find(params[:id])
  end
end
