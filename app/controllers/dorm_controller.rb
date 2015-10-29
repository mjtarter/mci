class DormController < ApplicationController

	def index
  		@dorms = Dorm.with_user_data
 
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
			params.require(:dorm).permit(:name, :dorm_type, :lat, :lng, :location, :address)
		end

end

