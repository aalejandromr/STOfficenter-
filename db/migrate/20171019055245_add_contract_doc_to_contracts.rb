class AddContractDocToContracts < ActiveRecord::Migration
  def change
  	add_column :contracts, :contract_doc, :string
  end
end
