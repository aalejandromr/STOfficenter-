class AddCantidadEmpleadosToContract < ActiveRecord::Migration
  def change
  	add_column :contracts, :cantidadEmpleados, :integer
  end
end
