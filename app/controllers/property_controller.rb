class PropertyController < ApplicationController
	
	#Change main navigation to property navigation
	before_filter :set_nav
	def set_nav
		@property_nav = true
	end

	def create
		if @property = Property.create(property_params)
			redirect_to(:controller => 'property', :action => 'new')
		else
			render('new')
		end
	end

	def index
		@disable_footer = true

		#Property Serch Form Params
		@availability = params[:availability] || property_params[:availability]
		@type = params[:property_type] || property_params[:property_type]
		@bedrooms = params[:bedrooms] || property_params[:bedrooms]
		@min_price = params[:min_price] || property_params[:min_price]
		@max_price = params[:max_price] || property_params[:max_price]

		if @type != 'All'
			@query_type = {:property_type => @type}
		end
		if @availability != 'All'
			@query_availability = {:availability => @availability}
		end
		if @bedrooms != 'All'
			@query_bedrooms = "bedrooms LIKE ?", "%#{@bedrooms}%"
		end

		#Query DB for matching properties
  		@properties = Property
  			.where(@query_type)
  			.where(@query_availability)
  			.where(@query_bedrooms)
  			.by_price(@min_price, @max_price)
			
		#Create json file to be used for google map
  		respond_to do |format|
    		format.html
    		format.json { render :json => @properties }
  		end
	end

	def property
		@id = params[:id]
		@property = Property.find(@id)
		@unit_features = [:ac, :microwave]
	end

	private

		def property_params
			params.require(:property).permit(:id, :property_type, :address, :lat, :lng, :bedrooms, :baths, :price, :price_two, :min_price, :max_price, :availability, :date_available, :floors, :term_number, :term, :sqft, :description, :facility_name, :property_manager, :office_address, :phone, :email, :website, :facebook, :ac, :microwave, :refrigerator, :washer_dryer, :dishwasher, :garbage_disposal, :patio_balcony, :walk_in_closets, :locking_room_doors, :storage_space, :furnished, :ceiling_fans, :electric_gas, :trash, :water, :cable, :internet, :dogs_allowed, :cats_allowed, :other_pets_allowed, :laundry_facilities, :computer_lab, :fitness_center, :lounge, :controlled_access, :swimming_pool, :on_site_maintenance, :courtyard, :parking, :resident_functions, :on_bus_route, :elevator, :additional_amenities)
		end

end
