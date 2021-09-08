class EstablishmentTerm < ApplicationRecord
	validates :name, :description , :type_term, :publication_date, :inactivated_date, :publicated_by, :link_term, presence: :true
end
