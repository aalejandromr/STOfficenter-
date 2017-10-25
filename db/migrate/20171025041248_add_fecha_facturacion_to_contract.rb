class AddFechaFacturacionToContract < ActiveRecord::Migration
  def change
  	add_column :contracts, :fecha_facturacion, :string
  end
end
