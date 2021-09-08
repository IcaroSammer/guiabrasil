class Publication < ApplicationRecord
	has_many_attached :documents
	has_many_attached :images
	has_many_attached :videos
end
