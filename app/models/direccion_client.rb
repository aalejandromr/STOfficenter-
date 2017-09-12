class DireccionClient < ActiveRecord::Base
	belongs_to :clients
	belongs_to :direccions
end
