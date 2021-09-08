class MainCourse < ApplicationRecord

	has_many_attached :ingredients_image
	has_many_attached :plate_image
	belongs_to :restaurant

	belongs_to :restaurant, optional: true

	before_save :remove_blank_emails 

	def remove_blank_emails
	  ingredients.reject!(&:blank?)
	end

	
	
end
