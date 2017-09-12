class CreateDireccions < ActiveRecord::Migration
  def change
    create_table :direccions do |t|
    	t.references :pais_origens
    	t.references :ciudads
    	t.references :calles
    	t.references :places
      t.timestamps null: false
    end
  end
end
