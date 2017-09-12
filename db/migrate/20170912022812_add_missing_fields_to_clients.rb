class AddMissingFieldsToClients < ActiveRecord::Migration
  def change
  	add_column :clients, :nombre_comercial, :string
  	add_column :clients, :registro_fiscal, :string
  	add_column :clients, :domicilio_fiscal, :string
  	add_column :clients, :pagina_web, :string
  	add_column :clients, :representante_legal, :string
  	add_column :clients, :correo, :string
  	add_column :clients, :telefono, :string
  	add_column :clients, :oficina_actual, :boolean
  	add_reference :clients, :direccion, index: true
  	add_foreign_key :clients, :direccions
  end
end
