class RemoveDuiAndTipoPersonaIdFromClients < ActiveRecord::Migration
  def up
  	remove_columns :clients, :dui
  	remove_foreign_key :clients, name: "fk_rails_731c1ea404"
  	remove_columns :clients, :tipoPersona_id
  end

  def down
  	
  end
end
