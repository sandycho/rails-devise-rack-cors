class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token
  
  before_action :authenticate_user!, except: [:home, :getUnknownUser]
  
  respond_to :json
  def home
  end
  
  # GET 'application#getUser'
  def getUser
     respond_to do |format|
       format.html { render 'getUser'}
       format.json  { render json: { data:  current_user.email }.to_json }
     end
    #render json: "{'data'=> 'helloUnknown'}"
  end
  
  # GET 'helloUnknown'
  def getUnknownUser
    render json: "{'data'=> 'helloUnknown'}"
  end
end