class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token
  
  before_action :authenticate_user!, except: :home
  
  def home
  end
  
  # GET 'application#getUser'
  def getUser
    @user = User.new(email: 'usertest0@test.com')
  end
  
  # GET 'helloUnknown'
  def helloUnknown
    render json: "{'data'=> 'helloUnknown'}"
  end
end