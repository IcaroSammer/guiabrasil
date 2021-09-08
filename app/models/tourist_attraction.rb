class TouristAttraction < ApplicationRecord
	has_many_attached :photos
	has_many_attached :videos
	has_many :tourist_attraction_surveys
	belongs_to :establishment
	accepts_nested_attributes_for :establishment
end
