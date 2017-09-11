class AddForeignKeyRolToUser < ActiveRecord::Migration
  def change
  	add_foreign_key :users, :rols, index: true
  end
end
