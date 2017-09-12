class PaisOrigen < ActiveRecord::Base
	has_many :clients
	has_many :direccions
	def name_with_initial
		"#{description}"
	end
end
