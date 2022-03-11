class ApplicationController < ActionController::Base
  def index
    @current_user = current_user
  end

  def current_user
    User.take
  end
end
