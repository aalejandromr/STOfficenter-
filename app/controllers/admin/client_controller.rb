class Admin::ClientController < ApplicationController

	def index
		@clientes = Client.count
	end

	def new
		@tipoPersonas = TipoPersona.all
		@paises = PaisOrigen.all
		@Client = Client.all
	end

	def edit
		@ClientFound = Client.find_by(rec_id: params[:id])
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
			redirect_to admin_client_index_path
		else
			flash[:error] = "Something went wrong, please make sure to fullfil the form correctly."
			redirect_to admin_client_index_path
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
			rec_id: cliente[:rec_id])
		if result
			flash[:success ] = "Your client was successfully created."
			redirect_to admin_client_path
		else
			flash[:error] = "Something went wrong, please make sure to fullfil the form correctly."
			redirect_to admin_client_path
		end
	end

	def show
		client = Client.find_by(rec_id: params[:id])

		render :json => client
	end
end