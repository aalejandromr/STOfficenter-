class AddContact < ActiveRecord::Migration
  def change
  	create_table :contacts do |t|
	  	t.text :first_name
	  	t.text :middle_name
	  	t.text :last_name
	  	t.text :sur_name
	  	t.text :phone_contact
	  	t.text :mobil_contact
	  	t.text :email
	  	t.timestamps null: false
	  end
  end
end

