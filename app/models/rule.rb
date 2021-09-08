class Rule < ApplicationRecord
	validates :name, :order, presence: :true
end
