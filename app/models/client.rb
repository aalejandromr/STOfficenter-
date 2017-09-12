class Client < ActiveRecord::Base
	belongs_to :pais_origen
	has_many :clientcontacts
	has_many :direccion_clients
end
