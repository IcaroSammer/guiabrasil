class CitiesController < ApplicationController
	layout "home"
	before_action :load_city, only: [:index]

	def index
		if @city.present?
			load_hotels
			load_restaurants
			load_tourist_attractions
		else
			@cities = City.order(:city).page(params[:page] || 1).per_page(3)
		end	
	end


	private

	def load_hotels
		@hotels = Hotel.where(establishment_id: Establishment.where(nationality: @city.country, state: @city.state, city: @city.city, business_establishment: Hotel.model_name.name).pluck(:id)).order(:final_score_evaluation)
	end

	def load_restaurants
		@restaurants = Restaurant.where(establishment_id: Establishment.where(nationality: @city.country, state: @city.state, city: @city.city, business_establishment: Restaurant.model_name.name).order(:final_note).pluck(:id))
	end

	def load_tourist_attractions
		@tourist_attractions = TouristAttraction.where(establishment_id: Establishment.where(nationality: @city.country, state: @city.state, city: @city.city, business_establishment: TouristAttraction.model_name.name).order(:final_note).pluck(:id))
	end

	def load_city
		@city = City.find(params[:id])
	end


	def city_params
		params
		.require(:city)
		.permit(
			:text_apresentation,
			:best_time,
			:how_find,
			:city,
			:state,
			:country,
			:biome,
			:perfect_day,
			:special,
			:perfect_day_remarks,
			:region,
			:establishment_id,
			:best_experiences,
			differentials:[],
			photos:[],
			videos: [],
			documents: []
			) 
	end

end
