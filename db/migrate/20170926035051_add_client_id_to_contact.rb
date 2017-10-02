class AddClientIdToContact < ActiveRecord::Migration
  def change
  	add_reference :contacts, :client, index: true
  	#add_foreign_key :contacts, :client
  end
end
