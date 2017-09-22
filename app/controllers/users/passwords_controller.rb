class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  def new
      @dissable_sidenav = true
      @dissable_topnav = true
      @dissable_footer = true
  end


  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  def update
     @dissable_sidenav = true
     user = params[:user]
     userToFound = User.where(email: user["email"]).take
     User.update(userToFound.id, :RequestResetPassword => true)
     redirect_to root_path
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
