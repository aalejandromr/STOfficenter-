class CreateDireccionClients < ActiveRecord::Migration
  def change
    create_table :direccion_clients do |t|
    	t.references :direccions
    	t.references :clients
      t.timestamps null: false
    end
  end
end
