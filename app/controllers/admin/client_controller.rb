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
		@ClientFound = Client.find(params[:id])
		@AllClientContact = Contact.where(client_id: @ClientFound.id)
	end

	def destroy
		cliente = Client.where(id: params[:id])
		Client.update(cliente[0].id, status: false)
		render :json => cliente
	end

	def active_client
		cliente = Client.where(id: params[:id])
		Client.update(cliente[0].id, status: true)
		render :json => cliente
	end

	def inactive_client
		cliente = Client.where(id: params[:id])
		Client.update(cliente[0].id, status: false)
		render :json => cliente
	end

	def update
		cliente = params[:client]
		client = Client.find(params[:id])
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
		#cliente = params[:client]
		#fecha = DateTime.new(cliente[:fecha_de_constitucion])
		
		#@date = 
		#I18n.locale = :es
		#prueba = l("03/11/2017".to_date, format: '%A %d de %B, hello %Y') 
		#day = I18n.t l(cliente[:fecha_de_constitucion].to_date, format: '%A')
		#day_number = l(cliente[:fecha_de_constitucion].to_date, format: '%d')
		#month = I18n.t l(cliente[:fecha_de_constitucion].to_date, format: '%B')
		#year = l(cliente[:fecha_de_constitucion].to_date, format: '%Y')
		#fecha = "#{day} #{day_number} de #{month} del #{year}"
		#abort(fecha.to_s)
		#l @item.created_at, :format => "%b %e, %Y", :locale => 'en'
		#"03/11/2017".to_date.strftime("%A")
		#abort()
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
			sector_economico: cliente[:sector_economico],
			status: true)

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
			dui: contact[:dui],
			rec_id: contact[:rec_id],
			client_id: result.id)
		if result
			flash[:success ] = "Tu cliente y su contacto fueron guardados correctamente."
			redirect_to admin_client_index_path
		else
			flash[:error] = "Algo salio mal, intentalo de nuevo."
			redirect_to admin_client_index_path
		end
	end

	def show
		cliente = Client.find(params[:id])
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