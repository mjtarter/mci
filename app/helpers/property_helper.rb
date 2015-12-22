module PropertyHelper

	def icon_by_property(type)
		if type == "Apartment" 
			return '<i class="fa fa-building"></i>'
		 else 
			 return '<i class="fa fa-home"></i>'
		 end 
	 end

	 def color_by_property(type)
		if type == "House" 
			return "#00CED1;" 
		 elsif type == "Townhome"
			 return "#8080E6;" 
		 else 
			 return "#D2B48C;" 
		 end 
	 end 

	 def price_range(price_one, price_two)
		if price_two.present?
			return "$ #{price_one} - #{price_two}"
		else
			return "$ #{price_one}"
		end
	end

	def property_name(facility_name, address)
		if facility_name.present?
			return facility_name
		else
			return address
		end
	end

	def location_step_complete?
		if @property.address.present? == true && @property.property_type.present? == true && @property.city.present? == true && @property.state.present? == true
			return '<span class="glyphicon glyphicon-ok" style="color:#00ced1; float:right;"></span>'.html_safe
		end
	end

	def basic_info_step_complete?
		if @property.bedrooms.present? == true && @property.baths.present? == true && @property.availability != nil && @property.price.present? == true && @property.term.present? == true && @property.term_number.present? == true
			return '<span class="glyphicon glyphicon-ok" style="color:#00ced1; float:right;"></span>'.html_safe
		end
	end

	def contact_info_step_complete?
		if @property.email.present? == true
			return '<span class="glyphicon glyphicon-ok" style="color:#00ced1; float:right;"></span>'.html_safe
		end
	end

	def description_step_complete?
		if @property.description.present? == true
			return '<span class="glyphicon glyphicon-ok" style="color:#00ced1; float:right;"></span>'.html_safe
		end
	end

	def amenities_step_complete?
		if @property.property_type == "apartment"
			if @property.ac != nil && @property.microwave != nil && @property.refrigerator != nil && @property.washer_dryer != nil && @property.dishwasher != nil && @property.garbage_disposal != nil && @property.patio_balcony != nil && @property.walk_in_closets != nil && @property.locking_room_doors != nil && @property.storage_space != nil && @property.furnished != nil && @property.ceiling_fans != nil && @property.laundry_facilities != nil && @property.computer_lab != nil && @property.fitness_center != nil && @property.lounge != nil && @property.controlled_access != nil && @property.swimming_pool != nil && @property.on_site_maintenance != nil && @property.courtyard != nil && @property.parking != nil && @property.resident_functions != nil && @property.on_bus_route != nil && @property.elevator != nil
				return '<span class="glyphicon glyphicon-ok" style="color:#00ced1; float:right;"></span>'.html_safe
			end
		else
			if @property.ac != nil && @property.microwave != nil && @property.refrigerator != nil && @property.washer_dryer != nil && @property.dishwasher != nil && @property.garbage_disposal != nil && @property.patio_balcony != nil && @property.walk_in_closets != nil && @property.locking_room_doors != nil && @property.storage_space != nil && @property.furnished != nil && @property.ceiling_fans != nil
				return '<span class="glyphicon glyphicon-ok" style="color:#00ced1; float:right;"></span>'.html_safe
			end
		end
	end

	def additional_amenities_step_complete?
		return '<span class="glyphicon glyphicon-ok" style="color:#00ced1; float:right;"></span>'.html_safe
	end

	def utilities_step_complete?
		if @property.electric_gas != nil && @property.trash != nil && @property.water != nil && @property.cable != nil && @property.internet != nil && @property.dogs_allowed != nil && @property.cats_allowed != nil && @property.other_pets_allowed != nil
			return '<span class="glyphicon glyphicon-ok" style="color:#00ced1; float:right;"></span>'.html_safe
		end
	end

end