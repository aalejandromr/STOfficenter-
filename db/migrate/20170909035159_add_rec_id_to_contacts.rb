class AddRecIdToContacts < ActiveRecord::Migration
  def change
  	add_column :contacts, :rec_id, :string
  end
end
