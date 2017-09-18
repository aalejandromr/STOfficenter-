class Admin::AdminController < ApplicationController

	before_action :authenticate

	def index
		flash[:success ] = "Success Flash Message: Welcome to GentellelaOnRails"
	end

	private

		def authenticate
			if current_user.rol_id != 2
				flash[:error] = "Sorry, you are not authorized."
				redirect_to(:back)
			end
		end
end
