class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.text :description
    	t.string :surname
    	t.text :user_name
    	t.text :password
    	t.belongs_to :rol, index: true
     	t.timestamps null: false
    end	
  end
end
