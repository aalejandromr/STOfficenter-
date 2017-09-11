class AddPositionsToContact < ActiveRecord::Migration
  def change
  	add_column :contacts, :position_id, :integer
  	add_foreign_key :contacts, :positions, index: true
  end
end
