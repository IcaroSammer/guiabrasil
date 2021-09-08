class RestaurantSurvey < ApplicationRecord

	
	belongs_to :restaurant
	validates :couvert, presence: :true
	validates :starter_course, presence: :true
	validates :presentation_course, presence: :true
	validates :temperature, presence: :true
	validates :quality, presence: :true 
	validates :baking, presence: :true
	validates :harmony_ingredients, presence: :true
	validates :seasoning, presence: :true 
	validates :dessert, presence: :true 
	validates :final_sensation_meal, presence: :true

end
