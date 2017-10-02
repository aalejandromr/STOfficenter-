class AddClientToContract < ActiveRecord::Migration
  def change
  	add_reference :contracts, :client, index: true
  end
end
