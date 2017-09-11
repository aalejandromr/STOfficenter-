class CreatePaisOrigens < ActiveRecord::Migration
  def change
    create_table :pais_origens do |t|
    	t.string :description
		t.timestamps null: false
    end
  end
end
