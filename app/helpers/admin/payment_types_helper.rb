module Admin::PaymentTypesHelper
	def human_attribute_payment_methods
		Hash[PaymentType.payment_methods.map { |k,v| [PaymentType.human_attribute_name("payment_methods.#{k}"), k] }].sort
	end

	def human_attribute_payment_brands
		Hash[PaymentType.payment_brands.map { |k,v| [PaymentType.human_attribute_name("payment_brands.#{k}"), k] }].sort
	end

	def human_attribute_establishment_types
	  Hash[PriceRange.establishment_types.map { |k,v| [PriceRange.human_attribute_name("establishment_types.#{k}"), k] }].sort
	end


end
