class AddTipoContratoTipoDocumentoOficinaToContract < ActiveRecord::Migration
  def change
  	add_reference :contracts, :tipo_contrato, index: true
  	add_foreign_key :contracts, :tipo_contratos
  	add_reference :contracts, :tipo_documento, index: true
  	add_foreign_key :contracts, :tipo_documentos
  	add_reference :contracts, :oficina, index: true
  	add_foreign_key :contracts, :oficinas
  end
end
