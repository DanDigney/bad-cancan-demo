class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception

  check_authorization # <-- This is the full lockdown
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end
end
