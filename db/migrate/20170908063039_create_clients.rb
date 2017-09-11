class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
		t.string :nombre, null: false
		t.string :dui,              null: false, default: ""
		t.string :nit,              null: false, default: ""
		t.string :giroEmpresa
		t.integer :tipoPersona_id
		t.integer :cantidadEmpleados
		t.date :fecha_de_constitucion
		t.boolean :empresaNacional
		t.integer :pais_origen_id
		t.timestamps null: false
    end
  end
end
