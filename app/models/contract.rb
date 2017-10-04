class Contract < ActiveRecord::Base
	belongs_to :client, class_name: Client
	belongs_to :periodo_facturacion, class_name: PeriodoFacturacion
	belongs_to :oficina, class_name: Oficina
	belongs_to :tipo_documento, class_name: TipoDocumento
	belongs_to :tipo_contrato, class_name: TipoContrato
end
