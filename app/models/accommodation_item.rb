class AccommodationItem < ApplicationRecord
	validates :name, :order, presence: :true
end
