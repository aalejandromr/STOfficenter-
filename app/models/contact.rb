class Contact < ActiveRecord::Base
	belongs_to :positions

	has_many :clientcontacts
end
