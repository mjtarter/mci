class CreateDorms < ActiveRecord::Migration
  def change
    create_table :dorms do |t|
    	t.string :name, :null => false
    	t.decimal :lat, :precision => 8, :scale => 6
    	t.decimal :lng, :precision => 8, :scale => 6
    	t.string :location
    	t.string :phone
    	t.string :email
    	t.string :address
    	t.string :dorm_type
    	t.integer :floors
    	t.string :beds
    	t.string :rooms
    	t.string :bathrooms
    	t.string :gender_on_floor
    	t.text :description
    	t.string :price
    	t.string :parking_zone
    	t.boolean :academic_support_center
    	t.boolean :computer_lab
    	t.boolean :library
    	t.boolean :ud_academic_advising
    	t.boolean :ac
    	t.boolean :carpet_in_room
    	t.boolean :dining_onsite
    	t.boolean :music_practice_room
    	t.boolean :piano
    	t.boolean :dance_studio
    	t.boolean :exercise_room
    	t.boolean :game_room
    	t.boolean :laundry_on_floor
    	t.boolean :laundry_ground_floor
    	t.boolean :quiet_study_area
    	t.boolean :community_kitchen
    	t.boolean :iu_secure_wifi
      t.timestamps null: false
    end
  end
end
