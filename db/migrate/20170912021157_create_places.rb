class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
    	t.string :description
    	t.references :calles
      t.timestamps null: false
    end
  end
end
