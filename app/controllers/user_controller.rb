class UserController < ApplicationController
	
	def index
		if user_signed_in?
			redirect_to "/"
		else
			redirect_to "/users/login"	
		end
		
	end

	def login
		abort("Message goes here")
	end


end
