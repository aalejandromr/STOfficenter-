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
			position_id: params[:position][:position_id],
			rec_id: contact[:rec_id],
			dui: contact[:dui])
		if result
			flash[:success] = "Tu contacto fue creado exitosamente."
			redirect_to new_admin_client_path
		else
			flash[:error] = I18n.t l("wrong_form")
			redirect_to new_admin_client_path
		end
	end

	def edit
		@ContactFound = Contact.find_by(rec_id: params[:id])
	end

	def update
		contact = params[:contact]
		toUpdate = Contact.find_by(rec_id: contact[:rec_id])
		result = toUpdate.update_attributes(
			:first_name => contact[:first_name],  
			:middle_name => contact[:middle_name],
			:sur_name => contact[:sur_name], 
			:last_name => contact[:last_name],  
			:phone_contact => contact[:phone_contact], 
			:mobil_contact => contact[:mobil_contact], 
			:email => contact[:email], 
			:dui => contact[:dui], 
			:nit => contact[:nit])
		if result
			flash[:success] = "Tu contacto se ha actualizado correctamente."
			redirect_to admin_client_index_path
		else
			flash[:error] = I18n.t l("wrong_form")
			redirect_to admin_client_index_path
		end
	end
end
