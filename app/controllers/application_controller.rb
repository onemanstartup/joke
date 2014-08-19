class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User, fallback_to_devise: false
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def json_request?
    request.format.json?
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  private

  def user_not_authorized
    flash_error 'У вас недостаточно привилегий для данного действия'
    redirect_to(request.referrer || root_path)
  end

  def https_redirect
    if ENV['ENABLE_HTTPS'] == 'yes'
      if request.ssl? && !use_https? || !request.ssl? && use_https?
        protocol = request.ssl? ? 'http' : 'https'
        flash.keep
        redirect_to protocol: "#{protocol}://", status: :moved_permanently
      end
    end
  end

  def use_https?
    true # Override in other controllers
  end

  def flash_success(message)
    flash[:success] = message
  end

  def flash_error(message)
    flash[:error] = message
  end

  def redirect_to_root
    redirect_to root_path
  end
end
