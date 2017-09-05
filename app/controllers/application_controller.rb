class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  check_authorization
end
