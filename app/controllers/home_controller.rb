class HomeController < BaseController
	layout "home"

	def index
		load_cities
	end



private

	def load_cities
		@cities = City.all
	end


end
