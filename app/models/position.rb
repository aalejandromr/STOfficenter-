class Position < ActiveRecord::Base
	has_many :contacts

	def name_with_initial
		"#{description}"
	end
end
