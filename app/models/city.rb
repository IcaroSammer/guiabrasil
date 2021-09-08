class City < ApplicationRecord
	has_many_attached :photos
	has_many_attached :videos
	has_many_attached :documents
	belongs_to :establishment, required: false
	accepts_nested_attributes_for :establishment
end
