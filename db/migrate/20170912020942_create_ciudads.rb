class CreateCiudads < ActiveRecord::Migration
  def change
    create_table :ciudads do |t|
    	t.string :description
    	t.references :pais_origens
      	t.timestamps null: false
    end
  end
end
