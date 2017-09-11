class AddTipoPersonasPaisOrigenToClient < ActiveRecord::Migration
  def change
    add_foreign_key :clients, :tipoPersonas, index: true
    add_foreign_key :clients, :pais_origens, index: true
  end
end
