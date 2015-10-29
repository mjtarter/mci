class DormController < ApplicationController

	def index
		#Create json file to be used for google map
  		@dorms = Dorm.all
  		respond_to do |format|
    		format.html # index.html.haml
    		format.json { render :json => @dorms }
  		end
	end
	
	def create
		if @dorm = Dorm.create(dorm_params)
			redirect_to(:controller => 'application', :action => 'index')
		else
			render('new')
		end
	end

	private

		def dorm_params
			params.require(:dorm).permit(:name, :dorm_type, :lat, :lng, :location, :address, :phone, :email)
		end

end

