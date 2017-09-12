class RemoveForeigncalleandplaceFromDireccions < ActiveRecord::Migration
  def up
  	#remove_foreign_key :direccions, name: "fk_rails_731c1ea404"
  	remove_columns :direccions, :calles_id
  	remove_columns :direccions, :places_id
  	add_column :direccions, :ubicacion, :string
  end
end
