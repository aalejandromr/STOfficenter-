class Client < ActiveRecord::Base
	belongs_to :pais_origen
	has_many :clientcontacts
end
