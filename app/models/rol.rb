class Rol < ActiveRecord::Base
	has_may :users
end
