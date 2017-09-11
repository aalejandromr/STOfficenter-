class AddRecIdToClients < ActiveRecord::Migration
  def change
  	add_column :clients, :rec_id, :string
  end
end
