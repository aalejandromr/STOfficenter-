class AddDireccionToOficinas < ActiveRecord::Migration
  def change
  	add_column :oficinas, :direccion, :string
  end
end
