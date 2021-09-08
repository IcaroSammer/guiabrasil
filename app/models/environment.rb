class Environment < ApplicationRecord
	validates :name, :business_establishment, presence: :true
end
