class AddMissingsFieldsToContract < ActiveRecord::Migration
  def change
  	add_column :contracts, :final_contrato, :date
  	add_column :contracts, :deposito, :boolean
  	add_column :contracts, :montoDeposito, :float
  	add_column :contracts, :usoTelefono, :boolean
  	add_column :contracts, :minutosAlMes, :integer
  	add_column :contracts, :llamadasExtrajero, :boolean
  	add_column :contracts, :usoSalaConferencias, :boolean
  	add_column :contracts, :usoSaltaConferenciaHoras, :float
  	add_column :contracts, :parqueosAsignados, :integer
  end
end
