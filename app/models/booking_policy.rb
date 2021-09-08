class BookingPolicy < ApplicationRecord
	validates :name, :description, :business_establishment, presence: :true
end
