class HotelSurvey < ApplicationRecord
	belongs_to :hotel
	accepts_nested_attributes_for :hotel

	
validates  :location_score , :circulation_score , :conservation_score ,  :structure_score ,  :recreation_score ,  :social_score , :services_score, :acomodation_score , :final_rate, 	presence: :true 

	
end
