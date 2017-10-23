class AddUserRequesterAndStatusToContract < ActiveRecord::Migration
  def change
  	add_column :contracts, :status, :boolean 
  	add_column :contracts, :requester, :string
  end
end
