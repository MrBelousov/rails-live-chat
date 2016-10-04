class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Callbacks
  before_action :authenticate_user!
end
