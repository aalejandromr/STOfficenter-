class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
 		t.string :servicio_contratado
 		t.string :centro_de_negocio
 		t.string :condicion
 		t.date :fecha_de_contratacion
 		t.string :nit_representante_legal
 		t.string :dui_representante_legal
 		t.string :telefono_representante_legal
 		t.string :correo_representante_legal
      t.timestamps null: false
    end
  end
end
