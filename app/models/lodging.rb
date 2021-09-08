class Lodging < ApplicationRecord
	validates :name, :description, :order, presence: :true
end
