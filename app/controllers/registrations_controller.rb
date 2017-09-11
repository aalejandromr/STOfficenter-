class RegistrationsController < Devise::RegistrationsController


	private

	def sign_in_params
		params.require(:user).permit(:name, :email, :password, :rol_id)
	end

end