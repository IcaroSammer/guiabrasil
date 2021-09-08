module User::HotelSurveysHelper

	def human_attribute_social_items
		Hash[SocialItem.where("business_establishment @> ?", '{HOTEIS}').map { |k,v| [SocialItem.human_attribute_name("social_itemms.#{k}"), k] }].sort
	end

	def human_attribute_recreation_items
		Hash[RecreationArea.where("business_establishment @> ?", '{HOTEIS}').map { |k,v| [RecreationArea.human_attribute_name("recreation_items.#{k}"), k] }].sort
	end

	def human_attribute_structure_items
		Hash[Structure.where("business_establishment @> ?", '{HOTEIS}').map { |k,v| [Structure.human_attribute_name("structure_items.#{k}"), k] }].sort
	end

	def human_attribute_service_items
		Hash[Service.where("business_establishment @> ?", '{HOTEIS}').map { |k,v| [Service.human_attribute_name("service_items.#{k}"), k] }].sort
	end	

	def human_attribute_accomodation_items
		Hash[AccommodationItem.where("business_establishment @> ?", '{HOTEIS}').map { |k,v| [AccommodationItem.human_attribute_name("accomodation_items.#{k}"), k] }].sort
	end	

end
