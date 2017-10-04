class CreateTipoContratos < ActiveRecord::Migration
  def change
    create_table :tipo_contratos do |t|
    	t.string :tipoContrato
      t.timestamps null: false
    end
  end
end
