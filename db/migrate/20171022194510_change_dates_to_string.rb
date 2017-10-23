class ChangeDatesToString < ActiveRecord::Migration
  def change
  	change_column :contracts, :fecha_de_contratacion, :string
  	change_column :clients, :fecha_de_constitucion, :string
  	change_column :contracts, :final_contrato, :string
  end
end
