class Admin::ClientController < ApplicationController

	before_action :authenticate

	def index
		@clientes = Client.count
		@client_active = Client.all.where(status: true)
		@client_inactive = Client.all.where(status: false)
	end

	def new
		@tipoPersonas = TipoPersona.all
		@paises = PaisOrigen.all
		@Client = Client.all
	end

	def edit
		@ClientFound = Client.find_by(rec_id: params[:id])
	end

	def destroy
		cliente = Client.where(rec_id: params[:id])
		Client.update(cliente[0].id, status: false)
		render :json => cliente
	end

	def active_client
		cliente = Client.where(rec_id: params[:id])
		Client.update(cliente[0].id, status: true)
		render :json => cliente
	end

	def inactive_client
		cliente = Client.where(rec_id: params[:id])
		Client.update(cliente[0].id, status: false)
		render :json => cliente
	end

	def update
		cliente = params[:client]
		client = Client.find_by(rec_id: params[:id])
		result = client.update_attributes(
			:nombre => cliente[:nombre],  
			:nit => cliente[:nit],
			:nombre_comercial => cliente[:nombre_comercial], 
			:giroEmpresa => cliente[:giroEmpresa],  
			:cantidadEmpleados => cliente[:cantidadEmpleados], 
			:fecha_de_constitucion => cliente[:fecha_de_constitucion], 
			:empresaNacional => params[:empresaNacional], 
			:pais_origen_id => cliente[:pais_origen_id], 
			:representante_legal => cliente[:representante_legal],
			:oficina_actual => params[:oficina_actual],
			:correo => cliente[:correo],
			:telefono => cliente[:telefono],
			:pagina_web => cliente[:pagina_web],
			:domicilio_fiscal => cliente[:domicilio_fiscal],
			:registro_fiscal => cliente[:registro_fiscal]
		)
		if result
			flash[:success ] = "Your client was successfully created."
			redirect_to new_admin_client_path
		else
			flash[:error] = "Something went wrong, please make sure to fullfil the form correctly."
			redirect_to new_admin_client_path
		end
	end

	def create
		abort(params[:client[2]].to_s)
		Request parameters
		{"client"=>
			{"0"=>{"name"=>"utf8",
		 "value"=>"✓"},
		 "1"=>{"name"=>"authenticity_token",
		 "value"=>"FGqylmzRwbU6aJbD2hI7z5fU9AqQbTexA/cUVRDZkpKB+nsE02Voc/ieV2DaAY8OGAFKQInkR75kX3w4PWp70g=="},
		 "2"=>{"name"=>"client[rec_id]",
		 "value"=>"CLNT000000011"},
		 "3"=>{"name"=>"client[nombre]",
		 "value"=>""},
		 "4"=>{"name"=>"client[giroEmpresa]",
		 "value"=>""},
		 "5"=>{"name"=>"client[sector_economico]",
		 "value"=>""},
		 "6"=>{"name"=>"client[nombre_comercial]",
		 "value"=>""},
		 "7"=>{"name"=>"client[nit]",
		 "value"=>""},
		 "8"=>{"name"=>"client[cantidadEmpleados]",
		 "value"=>""},
		 "9"=>{"name"=>"client[fecha_de_constitucion]",
		 "value"=>""},
		 "10"=>{"name"=>"empresaNacional",
		 "value"=>"3"},
		 "11"=>{"name"=>"paisorigen[pais_origen_id]",
		 "value"=>""},
		 "12"=>{"name"=>"client[representante_legal]",
		 "value"=>""},
		 "13"=>{"name"=>"oficina_actual",
		 "value"=>"3"},
		 "14"=>{"name"=>"client[correo]",
		 "value"=>""},
		 "15"=>{"name"=>"client[telefono]",
		 "value"=>""},
		 "16"=>{"name"=>"client[pagina_web]",
		 "value"=>""},
		 "17"=>{"name"=>"client[domicilio_fiscal]",
		 "value"=>""},
		 "18"=>{"name"=>"client[registro_fiscal]",
		 "value"=>""}},
		 "contact"=>{"0"=>{"name"=>"utf8",
		 "value"=>"✓"},
		 "1"=>{"name"=>"authenticity_token",
		 "value"=>"FGqylmzRwbU6aJbD2hI7z5fU9AqQbTexA/cUVRDZkpKB+nsE02Voc/ieV2DaAY8OGAFKQInkR75kX3w4PWp70g=="},
		 "2"=>{"name"=>"contact[rec_id]",
		 "value"=>"CNT00000004"},
		 "3"=>{"name"=>"contact[first_name]",
		 "value"=>""},
		 "4"=>{"name"=>"contact[middle_name]",
		 "value"=>""},
		 "5"=>{"name"=>"contact[last_name]",
		 "value"=>""},
		 "6"=>{"name"=>"contact[sur_name]",
		 "value"=>""},
		 "7"=>{"name"=>"contact[dui]",
		 "value"=>""},
		 "8"=>{"name"=>"contact[nit]",
		 "value"=>""},
		 "9"=>{"name"=>"contact[phone_contact]",
		 "value"=>""},
		 "10"=>{"name"=>"contact[mobil_contact]",
		 "value"=>""},
		 "11"=>{"name"=>"contact[email]",
		 "value"=>""},
		 "12"=>{"name"=>"position[position_id]",
		 "value"=>""}}}
		cliente = params[:client]
		result = Client.create(
			nombre: cliente[:nombre],  
			nit: cliente[:nit],
			nombre_comercial: cliente[:nombre_comercial], 
			giroEmpresa: cliente[:giroEmpresa],  
			cantidadEmpleados: cliente[:cantidadEmpleados], 
			fecha_de_constitucion: cliente[:fecha_de_constitucion], 
			empresaNacional: params[:empresaNacional], 
			pais_origen_id: params[:paisorigen][:pais_origen_id], 
			representante_legal: cliente[:representante_legal],
			oficina_actual: cliente[:oficina_actual],
			correo: cliente[:correo],
			telefono: cliente[:telefono],
			pagina_web: cliente[:pagina_web],
			domicilio_fiscal: cliente[:domicilio_fiscal],
			registro_fiscal: cliente[:registro_fiscal],
			rec_id: cliente[:rec_id],
			status: true)
		if result
			flash[:success ] = "Your client was successfully created."
			redirect_to admin_client_index_path
		else
			flash[:error] = "Something went wrong, please make sure to fullfil the form correctly."
			redirect_to admin_client_index_path
		end
	end

	def show
		cliente = Client.find_by(rec_id: params[:id])
		render :json => cliente
	end

	private

	def authenticate
		if current_user.rol_id != 2
			flash[:danger] = "Sorry, you are not authorized."
			redirect_to(:back)
		end
	end





end