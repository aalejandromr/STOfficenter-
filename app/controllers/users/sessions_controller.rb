class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  layout false
  # GET /resource/sign_in
  def new
    @user = User.new
  end

  # POST /resource/sign_in
  def create
  #   super
    user = User.where(email: params[:user]['email'], encrypted_password: Digest::MD5.hexdigest(params[:user]['password'])).first
    #user = User.where(email: params[:user]['email'], password: params[:user]['password']).first

    if user
      sign_in user
      if user_signed_in?
        if user.rol_id == 1
          redirect_to superadmin_superadmin_index_path
        elsif user.rol_id == 2
          redirect_to "/admin/admin"
        else
          redirect_to "/"
        end
      else
        redirect_to "/users/login"
      end
    else
      @user = User.new
      flash[:error] = "Usuario y contraseña no valido, intentalo nuevamente."
    end
    
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:user, keys: [:attribute])
  end
end
