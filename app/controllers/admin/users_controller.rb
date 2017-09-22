class Admin::UsersController < ApplicationController

	def reset_user_password
		@resetRequest = User.where(RequestResetPassword: true, Supervisor: current_user.id)
	end

	def reset_user_password_action
		user = User.find(params[:id])
		user.update(:encrypted_password => Digest::MD5.hexdigest(params[:password]), :RequestResetPassword => false)
		render :json => user
	end

	def show
		
	end
end
