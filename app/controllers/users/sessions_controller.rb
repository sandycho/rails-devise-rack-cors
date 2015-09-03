class Users::SessionsController < Devise::SessionsController
  #respond_to :json
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end
  
  def create
    if request.xhr?
      resource = warden.authenticate!(:scope => resource_name, :recall => "sessions#failure")
      return sign_in_and_redirect(resource_name, resource)
    else
      super
    end
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
