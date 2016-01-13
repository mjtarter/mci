class PropertyUploadStepsController < ApplicationController
  layout "property_upload"

	include Wicked::Wizard
  	steps :location, :basic_info, :contact_info, :description, :amenities, :community_features, :additional_amenity, :utilities, :submit

  	def show
      @property = Property.find(params[:property_id])
      @skip = params[:skip]
      if @skip == 'location_step'
        case step
        when :location
          jump_to(:basic_info)
        end
      end
      #Skip community features step if property type != Apartment
      if @property.property_type != "Apartment"
        case step
        when :community_features
          jump_to(:additional_amenity)
        end
      end
      render_wizard
    end

  	def update
	    @property = Property.find(params[:property_id])
      case step
      when :additional_amenity
        @property.additional_amenities = params[:additional_amenities]
      end
      params[:property][:status] = step
      params[:property][:status] = 'active' if step == steps.last
	    @property.attributes = property_params
	    render_wizard @property
  	end

  private

    def property_params
		  params.require(:property).permit(:id, :status, :property_type, :address, :city, :state, :lat, :lng, :bedrooms, :baths, :rent, :rent_two, :min_rent, :max_rent, :availability, :date_available, :floors, :term_number, :term, :sqft, :description, :facility_name, :property_manager, :office_address, :phone, :email, :website, :facebook, :ac, :microwave, :refrigerator, :washer_dryer, :dishwasher, :garbage_disposal, :patio_balcony, :walk_in_closets, :locking_room_doors, :storage_space, :furnished, :ceiling_fans, :electric_gas, :trash, :water, :cable, :internet, :dogs_allowed, :cats_allowed, :other_pets_allowed, :laundry_facilities, :computer_lab, :fitness_center, :lounge, :controlled_access, :swimming_pool, :on_site_maintenance, :courtyard, :parking, :resident_functions, :on_bus_route, :elevator, :additional_amenities)
    end

    def finish_wizard_path
      '/property/index_landlord'
    end

end