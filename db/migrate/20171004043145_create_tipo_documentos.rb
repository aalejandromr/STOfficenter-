class CreateTipoDocumentos < ActiveRecord::Migration
  def change
    create_table :tipo_documentos do |t|
    	t.string :tipoDocumento
      t.timestamps null: false
    end
  end
end
