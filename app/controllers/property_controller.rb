class PropertyController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :show_landlord]

	def index
		if params[:view] != "list" 
			@disable_footer = true
		end

		#Property Serch Form Params
		@availability = params[:availability] || property_params[:availability]
		@type = params[:property_type] || property_params[:property_type]
		@bedrooms = params[:bedrooms] || property_params[:bedrooms]
		@min_rent = params[:min_rent] || property_params[:min_rent]
		@max_rent = params[:max_rent] || property_params[:max_rent]

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
  			.by_rent(@min_rent, @max_rent)
  			.approved

  		if params[:view] == "list" 
			@properties = @properties.paginate(page: params[:page], per_page: 10)
		end
			
		#Create json file to be used for google map
  		respond_to do |format|
    		format.html
    		format.json { render :json => @properties }
  		end
	end

	def show
		@id = params[:id]
		@property = Property.find(@id)
		if @property.approved == true
			#Amenities 
			@pets = ["Dogs Allowed", @property.dogs_allowed], ["Cats Allowed", @property.cats_allowed], ["Other Allowed", @property.other_pets_allowed]
			@utilities = ["Electric / Gas", @property.electric_gas], ["Cable", @property.cable], ["Trash", @property.trash], ["Internet", @property.internet], ["Water", @property.water]
			@community_features = ["Laundry Facilities", @property.laundry_facilities], ["Computer Lab", @property.computer_lab], ["Fitness Center", @property.fitness_center], ["Lounge", @property.lounge], ["Controlled Access", @property.controlled_access], ["Swimming Pool", @property.swimming_pool], ["On-site Maintenance", @property.on_site_maintenance], ["Courtyard", @property.courtyard], ["Parking", @property.parking], ["Resident Functions", @property.resident_functions], ["On Bus Route", @property.on_bus_route], ["Elevator", @property.elevator]
			@unit_features = ["AC", @property.ac], ["Patio / Balcony", @property.patio_balcony], ["Microwave", @property.microwave], ["Walk-In Closets", @property.walk_in_closets], ["Refrigerator", @property.refrigerator], ["Locking Room Doors", @property.locking_room_doors], ["Washer / Dryer", @property.washer_dryer], ["Storage Space", @property.storage_space], ["Dishwasher", @property.dishwasher], ["Furnished", @property.furnished], ["Garbage Disposal", @property.garbage_disposal], ["Ceiling Fans", @property.ceiling_fans]
			@additional_amenities = [@property.additional_amenity_one, @property.additional_amenity_two, @property.additional_amenity_three, @property.additional_amenity_four, @property.additional_amenity_five, @property.additional_amenity_six, @property.additional_amenity_seven, @property.additional_amenity_eight, @property.additional_amenity_nine, @property.additional_amenity_ten]

			#Variables for location-map.js
			@lat = @property.lat
			@lng = @property.lng
	        @type = "All"
	        @availability = "All"
	        @bedrooms = "All"
	        @min_rent = 0
	        @max_rent = 100000
    	end
	end

	def new
		@property = Property.new
	end

	def create
		#status of 'inactive' stops any validations that require "active" from running.
		params[:property][:status] = 'inactive'
		@property = Property.new(property_params)
		@property.user_id = current_user.id
		if @property.save
			@skip = params[:skip]
			redirect_to property_upload_steps_path(:property_id => @property.id, :skip => @skip)
		else
			render('new')
		end
	end

	def contact 
		first_name = params[:first_name]
		last_name = params[:last_name]
		email = params[:email]
		message = params[:message]
		ContactMailer.contact_mci(first_name, last_name, email, message).deliver
		
		flash[:notice] = '<span class="glyphicon glyphicon-envelope"></span> Your message has been sent!'
		redirect_to(:controller => 'application', :action => 'index')
	end

	def contact_landlord
		first_name = params[:first_name]
		last_name = params[:last_name]
		email = params[:email]
		phone = params[:phone]
		message = params[:message]
		@id = params[:id]
		ContactLandlordMailer.landlord_email(first_name, last_name, phone, email, message).deliver

		flash[:notice] = '<span class="glyphicon glyphicon-envelope"></span> Your message has been sent!'
		redirect_to(:action => 'show', :id => @id)
	end

	private

		def property_params
			params.require(:property).permit(:id, :status, :property_type, :address, :city, :state, :lat, :lng, :bedrooms, :baths, :rent, :rent_two, :min_rent, :max_rent, :availability, :date_available, :floors, :term_number, :term, :sqft, :description, :facility_name, :property_manager, :office_address, :phone, :email, :website, :facebook, :ac, :microwave, :refrigerator, :washer_dryer, :dishwasher, :garbage_disposal, :patio_balcony, :walk_in_closets, :locking_room_doors, :storage_space, :furnished, :ceiling_fans, :electric_gas, :trash, :water, :cable, :internet, :dogs_allowed, :cats_allowed, :other_pets_allowed, :laundry_facilities, :computer_lab, :fitness_center, :lounge, :controlled_access, :swimming_pool, :on_site_maintenance, :courtyard, :parking, :resident_functions, :on_bus_route, :elevator, :additional_amenity_one, :additional_amenity_two, :additional_amenity_three, :additional_amenity_four, :additional_amenity_five, :additional_amenity_six, :additional_amenity_seven, :additional_amenity_eight, :additional_amenity_nine, :additional_amenity_ten, :agreement)
		end

end