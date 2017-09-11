class Admin::AdminController < ApplicationController

	def index
		flash[:success ] = "Success Flash Message: Welcome to GentellelaOnRails"
	end
end
