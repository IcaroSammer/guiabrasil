class TypeTerm < ApplicationRecord
	validates :name, :description, presence: :true
	
end
