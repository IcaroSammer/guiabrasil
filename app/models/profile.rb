class Profile < ApplicationRecord
	belongs_to :customers, required: false

end
