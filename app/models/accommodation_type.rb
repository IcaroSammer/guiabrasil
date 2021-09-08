class AccommodationType < ApplicationRecord
	validates :name, :description, :order, presence: :true
end
