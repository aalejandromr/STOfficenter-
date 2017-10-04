class AddPeriodoFacturacionToContracts < ActiveRecord::Migration
  def change
  	add_reference :contracts, :periodo_facturacion, index: true
  	add_foreign_key :contracts, :periodo_facturacions
  end
end
