class ApplicationController < ActionController::Base
  before_action :authenticate

  def authenticate
    @auth_key = (cookies[:_formationmaker_auth_key] ||= SecureRandom.hex(6))
  end
end
