class PropertyUploadStepsController < ApplicationController
  layout "property_upload"

	include Wicked::Wizard
  	steps :location, :basic_info, :contact_info, :description, :amenities, :additional_amenities, :utilities

  	def show
      @property = Property.find(params[:property_id])
      @skip = params[:skip]
      if @skip == 'location_step'
        case step
        when :location
          @friends = jump_to(:basic_info)
        end
      end
        render_wizard
    end

  	def update
	    @property = Property.find(params[:property_id])
	    @property.attributes = property_params
	    render_wizard @property
  	end

  private

  	def property_params
		  params.require(:property).permit(:id, :property_type, :address, :city, :state, :lat, :lng, :bedrooms, :baths, :price, :price_two, :min_price, :max_price, :availability, :date_available, :floors, :term_number, :term, :sqft, :description, :facility_name, :property_manager, :office_address, :phone, :email, :website, :facebook, :ac, :microwave, :refrigerator, :washer_dryer, :dishwasher, :garbage_disposal, :patio_balcony, :walk_in_closets, :locking_room_doors, :storage_space, :furnished, :ceiling_fans, :electric_gas, :trash, :water, :cable, :internet, :dogs_allowed, :cats_allowed, :other_pets_allowed, :laundry_facilities, :computer_lab, :fitness_center, :lounge, :controlled_access, :swimming_pool, :on_site_maintenance, :courtyard, :parking, :resident_functions, :on_bus_route, :elevator, :additional_amenities)
	   end

end