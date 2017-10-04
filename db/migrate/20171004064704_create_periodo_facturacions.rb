class CreatePeriodoFacturacions < ActiveRecord::Migration
  def change
    create_table :periodo_facturacions do |t|
    	t.string :periodo
      t.timestamps null: false
    end
  end
end
