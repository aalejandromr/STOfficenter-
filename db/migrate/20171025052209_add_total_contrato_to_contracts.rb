class AddTotalContratoToContracts < ActiveRecord::Migration
  def change
  	add_column :contracts, :total_contrato, :float
  end
end
