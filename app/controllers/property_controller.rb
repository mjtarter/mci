class PropertyController < ApplicationController

	def create
		if @property = Property.create(property_params)
			redirect_to(:controller => 'property', :action => 'new')
		else
			render('new')
		end
	end

	def index
		@disable_footer = true

		@availability = params[:availability] || property_params[:availability]
		@type = params[:property_type] || property_params[:property_type]

		if @type != 'All'
			@query_type = {:property_type => @type}
		end
		@query_availability = {:availability => @availability}

  		@properties = Property.where(@query_type).where(@query_availability)
		
		#Create json file to be used for google map
  		respond_to do |format|
    		format.html
    		format.json { render :json => @properties }
  		end
	end

	private

		def property_params
			params.require(:property).permit(:property_type, :address, :lat, :lng, :bedrooms, :baths, :price, :price_two, :availability, :date_available, :floors, :term_number, :term, :sqft, :description, :facility_name, :property_manager, :office_address, :phone, :email, :website, :facebook, :ac, :microwave, :refrigerator, :washer_dryer, :dishwasher, :garbage_disposal, :patio_balcony, :walk_in_closets, :locking_room_doors, :storage_space, :furnished, :ceiling_fans, :electric_gas, :trash, :water, :cable, :internet, :dogs_allowed, :cats_allowed, :other_pets_allowed, :laundry_facilities, :computer_lab, :fitness_center, :lounge, :controlled_access, :swimming_pool, :on_site_maintenance, :courtyard, :parking, :resident_functions, :on_bus_route, :elevator, :additional_amenities)
		end

end
