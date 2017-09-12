class RemoveDireccionsIdFromClients < ActiveRecord::Migration
  def up
  	#remove_foreign_key :clients, name: "fk_rails_731c1ea404"
  	remove_columns :clients, :direccions_id
  end
end
