class Admin::ContractController < ApplicationController
	def new
		@contract = Contract.create(
			client_id: params[:id],
			rec_id: "CNTRT0000000000#{Contract.count.to_i}"
		)		
		redirect_to	edit_admin_contract_path(:id => @contract)
	end

	def edit
		@Contract = Contract.find(params[:id])
		#Contract.joins(:client).select("contracts.*, clients.*").find(params[:id])
		@ClientFound = Client.find(@Contract.client)
	end

	def generate_contract
		#abort()
		contract = params[:contract]
		contrato = Contract.find(contract["id"]).update(
			:servicio_contratado => contract["servicio_contratado"],
			:centro_de_negocio => contract["centro_de_negocio"],
			:condicion => contract["condicion"],
			:fecha_de_contratacion => contract["fecha_de_contratacion"],
			:nit_representante_legal => contract["nit_representante_legal"],
			:dui_representante_legal => contract["dui_representante_legal"],
			:telefono_representante_legal => contract["telefono_representante_legal"],
			:correo_representante_legal => contract["correo_representante_legal"],
			:tipo_contrato_id => params["Tipo Contrato"],
			:tipo_documento_id => params["Tipo Documento"],
			:oficina_id => params["Oficina"],
			:cantidadEmpleados => contract["cantidadEmpleados"],
			:final_contrato => contract["final_contrato"],
			:deposito => params["Deposito"][0],
			:montoDeposito => contract["montoDeposito"],
			:usoTelefono => params["Uso del Telefono"],
			:minutosAlMes => contract["minutosAlMes"],
			:llamadasExtrajero => params["Llamadas al extranjero"][0],
			:usoSalaConferencias => params["Uso sala de conferencias"][0],
			:usoSaltaConferenciaHoras => contract["usoSaltaConferenciaHoras"],
			:parqueosAsignados => contract["parqueosAsignados"],
			:periodo_facturacion_id => params["Periodo Facturacion"]
		)


		info = Contract.joins(
			:client, 
			:periodo_facturacion, 
			:oficina, 
			:tipo_documento, 
			:tipo_contrato
			).select("contracts.*, 
			clients.*, 
			periodo_facturacions.*, 
			oficinas.*, 
			tipo_documentos.*, 
			tipo_contratos.*").find(contract["id"])

		doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/CONTRATO_MATRIZ.docx", "#{Rails.root}/tmp")
	    # Replace some variables. $var$ convention is used here, but not required.
	    doc.replace("$NOMBRE_CLIENTE$", info.client.nombre)
	    doc.replace("$DUI_CLIENTE$", info.client.nombre)
	    doc.replace("$OFICINA$", info.oficina.name)
	    doc.replace("$PLAZO_CONTRATO$", info.periodo_facturacion.periodo) #FALLO
	    doc.replace("$FECHA_DE_INICIO_DEL_CONTRATO$", info.fecha_de_contratacion)
	    doc.replace("$DEPOSITO_CLIENTE$", info.montoDeposito)
	    doc.replace("$RUBRO_CLIENTE$", info.client.sector_economico)
	    doc.replace("$CONSTITUCION_DE_LA_EMPRESA$", info.client.fecha_de_constitucion) #FALLO
	    doc.replace("$NOMBRE_COMERCIAL$", info.client.nombre_comercial)
	    # Write the document back to a temporary file
	    tmp_file = Tempfile.new('word_tempate', "#{Rails.root}/tmp")
	    doc.commit(tmp_file.path)
	    # Respond to the request by sending the temp file
	    send_file tmp_file.path, filename: "prueba_contrato.docx", disposition: 'attachment'

	    #redirect_to admin_client_index_path
	end

	def prueba
		@user = Contract.last
		#respond_to do |format|
		    #format.docx do
		      # Initialize DocxReplace with your template
		      doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/Prueba.docx", "#{Rails.root}/tmp")

		      # Replace some variables. $var$ convention is used here, but not required.
		      doc.replace("$NOMBRE$", @user.servicio_contratado)
		      
		      # Write the document back to a temporary file
		      tmp_file = Tempfile.new('word_tempate', "#{Rails.root}/tmp")
		      doc.commit(tmp_file.path)

		      # Respond to the request by sending the temp file
		      send_file tmp_file.path, filename: "prueba_report.docx", disposition: 'attachment'
		    #end
		  #end
	end
end
