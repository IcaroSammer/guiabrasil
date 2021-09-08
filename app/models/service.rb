class Service < ApplicationRecord
	validates :name, :description, :order, presence: :true
end
