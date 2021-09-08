class EstablishmentsManager

	def initialize()
	end

	def process(country, state, city, action)

		if action =="validate"

			return locale_existes(country, state, city)

		else

			if !locale_existes(country, state, city)
				create_city(country, state, city)
			end

		end

	end

	private
	
	def locale_existes(country, state, city)
		@city = City.where(country: country, state: state, city: city)
		return @city.exists?
	end

	def create_city(country, state, city)
		@city = City.create(country: country, state: state, city: city)
		@city.save()
	end

end