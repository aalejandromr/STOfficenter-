class AddRecIdToContracts < ActiveRecord::Migration
  def change
  	add_column :contracts, :rec_id, :string
  end
end
