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
			redirect_to admin_client_path
		else
			flash[:error] = "Something went wrong, please make sure to fullfil the form correctly."
			redirect_to admin_client_path
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