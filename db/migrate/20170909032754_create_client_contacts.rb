class CreateClientContacts < ActiveRecord::Migration
  def change
    create_table :client_contacts do |t|
    	t.references :clients
    	t.references :contacts
		t.timestamps null: false
    end
  end
end
