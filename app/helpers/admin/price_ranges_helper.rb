module Admin::PriceRangesHelper
	def human_attribute_establishment_types
	  Hash[PriceRange.establishment_types.map { |k,v| [PriceRange.human_attribute_name("establishment_types.#{k}"), k] }].sort
	end
	
end
