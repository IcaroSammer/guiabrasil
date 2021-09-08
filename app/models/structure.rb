class Structure < ApplicationRecord
	validates :name, :order, presence: :true
end
