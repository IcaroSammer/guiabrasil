class Restaurant < ApplicationRecord
	has_many_attached :photos
	has_many_attached :videos
	has_many_attached :documents

	belongs_to :establishment
	has_one :restaurant_survey
	has_one :chef
	has_many :main_courses , dependent: :destroy


	accepts_nested_attributes_for :establishment
	accepts_nested_attributes_for :restaurant_survey
	accepts_nested_attributes_for :chef
	accepts_nested_attributes_for :main_courses, allow_destroy: true
	
	has_many_attached :image
end
