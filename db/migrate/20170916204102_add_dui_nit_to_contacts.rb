class AddDuiNitToContacts < ActiveRecord::Migration
  def change
  	add_column :contacts, :dui, :string
  	add_column :contacts, :nit, :string
  end
end
