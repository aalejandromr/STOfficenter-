class Admin::ContactController < ApplicationController

	def create
		contact = params[:contact]   
		result = Contact.create(
			first_name: contact[:first_name],  
			middle_name: contact[:middle_name],
			last_name: contact[:last_name], 
			sur_name: contact[:sur_name],  
			phone_contact: contact[:phone_contact], 
			mobil_contact: contact[:mobil_contact], 
			email: contact[:email],
			position_id: params[:position][:position_id])
		if result
			flash[:success ] = "Your Contact was successfully created."
			redirect_to new_admin_client_path
		else
			flash[:error] = "Something went wrong, please make sure to fullfil the form correctly."
			redirect_to new_admin_client_path
		end
	end
end
