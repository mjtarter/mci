class PropertyController < ApplicationController
	def create
		if @property = Property.create(property_params)
			flash[:notice] = '<span class="glyphicon glyphicon-music"></span> Track added to library!'
			redirect_to(:controller => 'application', :action => 'index')
		else
			render('new')
		end
	end

	private

		def property_params
			params.require(:property).permit(:property_type, :address, :bedrooms, :baths, :price, :availability, :floors, :term)
		end
end
