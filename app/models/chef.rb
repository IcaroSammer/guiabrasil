class Chef < ApplicationRecord

	belongs_to :restaurant
	
	has_many_attached :photos
	has_many_attached :videos
end
