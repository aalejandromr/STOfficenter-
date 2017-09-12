class CreateCalles < ActiveRecord::Migration
  def change
    create_table :calles do |t|
    	t.string :description
    	t.references :ciudads
		t.timestamps null: false
    end
  end
end
