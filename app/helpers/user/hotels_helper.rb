module User::HotelsHelper

	def human_attribute_payment_methods
		Hash[PaymentType.where("business_establishment @> ?", '{RESTAURANTES}').map { |k,v| [k.id, v.name, k] }].sort
	end

	def human_attribute_price_range
			Hash[PriceRange.all.map { |k,v| [k.id, v.description ] }].sort
	end

	def human_attribute_environment
			Hash[Environment.all.map { |k,v| [k.id, v.name ] }].sort
	end

end
