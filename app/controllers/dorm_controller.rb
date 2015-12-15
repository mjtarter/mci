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
		@dorm_features = ["Academic Support Center", @dorm.academic_support_center], ["Computer Lab", @dorm.computer_lab], ["Library", @dorm.library], ["UD Academic Advising", @dorm.ud_academic_advising], ["AC", @dorm.ac], ["Carpet in Room", @dorm.carpet_in_room], ["Dining Onsite", @dorm.dining_onsite], ["Music Practice Room", @dorm.music_practice_room], ["Piano", @dorm.piano], ["Dance Studio", @dorm.dance_studio], ["Exercise Room", @dorm.exercise_room], ["Game Room", @dorm.game_room], ["Laundry Room on Floor", @dorm.laundry_on_floor], ["Laundry Room Ground Floor", @dorm.laundry_ground_floor], ["Quiet Study Area", @dorm.quiet_study_area], ["Community Kitchen", @dorm.community_kitchen], ["IU Secure WIFI", @dorm.iu_secure_wifi]
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

