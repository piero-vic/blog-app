class ApplicationController < ActionController::Base
  include Response

  def index
    @current_user = current_user
  end

  protect_from_forgery unless: -> { request.format.json? }

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :posts_counter)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :bio, :email, :password, :current_password)
    end
  end

  private

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path if resource_or_scope == :user
  end

  def json_request
    request.format.json?
  end

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
