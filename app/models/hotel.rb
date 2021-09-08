class Hotel < ApplicationRecord
	has_many_attached :photos
	has_many_attached :videos
	has_many_attached :documents
	has_one :hotel_survey
	belongs_to :establishment
	accepts_nested_attributes_for :establishment
	accepts_nested_attributes_for :hotel_survey
end
