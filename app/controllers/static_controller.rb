class StaticController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_authorization_check #cancancan
  
  def index
  end
end
