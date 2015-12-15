class DormController < ApplicationController

	def index
		#Create json file to be used for google map
  		@dorms = Dorm.all
  		respond_to do |format|
    		format.html # index.html.haml
    		format.json { render :json => @dorms }
  		end
	end

	def show
		@name = params[:name]
		@dorm = Dorm.find_by_name(@name)
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
			params.require(:dorm).permit(:name, :dorm_type, :lat, :lng, :location, :address, :phone, :email, :floors, :beds, :rooms, :bathrooms, :gender_on_floor, :description, :price, :parking_zone, :academic_support_center, :computer_lab, :library, :ud_academic_advising, :ac, :carpet_in_room, :dining_onsite, :music_practice_room, :piano, :dance_studio, :exercise_room, :game_room, :laundry_on_floor, :laundry_ground_floor, :quiet_study_area, :community_kitchen, :iu_secure_wifi)
		end

end

