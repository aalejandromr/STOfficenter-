class AddSectorEconomicoToClients < ActiveRecord::Migration
  def change
  	add_column :clients, :sector_economico, :string
  end
end
