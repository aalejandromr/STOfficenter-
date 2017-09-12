class Direccion < ActiveRecord::Base
	has_many :direccion_clients
	belongs_to :ciudads
	belongs_to :pais_origens
end
