class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  check_authorization :unless => :devise_controller? #Locks down all the actions with cancancan
end
