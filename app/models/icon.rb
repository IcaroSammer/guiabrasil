class Icon < ApplicationRecord
	has_one_attached :image

	validates :name, :description, :business_establishment, presence: :true 

end
