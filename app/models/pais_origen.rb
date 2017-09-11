class PaisOrigen < ActiveRecord::Base
	has_many :clients

	def name_with_initial
		"#{description}"
	end
end
