class AddTipoPersona < ActiveRecord::Migration
  def change
  	create_table :tipoPersonas do |t|
  		t.string :description
  		t.timestamps null: false
  	end
  end
end
