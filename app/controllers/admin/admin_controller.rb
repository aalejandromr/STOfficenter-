class Admin::AdminController < ApplicationController

	before_action :authenticate

	def index
		flash[:success ] = "Bienvenido"
	end

	private

		def authenticate
			if current_user.rol_id != 2
				flash[:error] = I18n.t l("not_authorized")
				redirect_to(:back)
			end
		end
end
