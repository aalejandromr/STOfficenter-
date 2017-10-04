class CreateOficinas < ActiveRecord::Migration
  def change
    create_table :oficinas do |t|
    	t.string :name
      t.timestamps null: false
    end
  end
end
