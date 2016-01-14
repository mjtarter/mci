class ProfileController < ApplicationController
	before_action :authenticate_user!

	def index
		@properties = Property.where({user_id: current_user})
	end

	def delete
		respond_to do |format|
			format.html { redirect_to :index }
			format.js
		end
	end

	def destroy
    	@properties.destroy
    	respond_to do |format|
      		format.html { redirect_to :index, notice: 'Property was successfully destroyed.' }
      		format.json { head :no_content }
    	end
    end

	private

		def property_params
			params.require(:property).permit(:id, :status, :property_type, :address, :city, :state, :lat, :lng, :bedrooms, :baths, :rent, :rent_two, :min_rent, :max_rent, :availability, :date_available, :floors, :term_number, :term, :sqft, :description, :facility_name, :property_manager, :office_address, :phone, :email, :website, :facebook, :ac, :microwave, :refrigerator, :washer_dryer, :dishwasher, :garbage_disposal, :patio_balcony, :walk_in_closets, :locking_room_doors, :storage_space, :furnished, :ceiling_fans, :electric_gas, :trash, :water, :cable, :internet, :dogs_allowed, :cats_allowed, :other_pets_allowed, :laundry_facilities, :computer_lab, :fitness_center, :lounge, :controlled_access, :swimming_pool, :on_site_maintenance, :courtyard, :parking, :resident_functions, :on_bus_route, :elevator, :additional_amenities, :agreement)
		end
end
