# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Property.create({:property_type => "House", :address => "310 East 10th Street, Bloomington, IN", :bedrooms => 5, :baths => 2, :price => 2775, :availability => 0, :date_available => "2015-11-1", :floors => 1, :term_number => 12, :term => "months"})
Property.create({:property_type => "House", :address => "211 East Cottage Grove Avenue, Bloomington, IN", :bedrooms => 3, :baths => 2, :price => 1170, :availability => 0, :date_available => "2015-11-18", :floors => 1, :term_number => 12, :term => "months"})
Property.create({:property_type => "House", :address => "417 East 10th Street, Bloomington, IN", :bedrooms => 4, :baths => 2, :price => 3000, :availability => 1, :floors => 2})
Property.create({:property_type => "Apartment", :address => "500 South Park Ridge Road, Bloomington, IN", :bedrooms => 3, :baths => 2, :price => 1170, :availability => 0, :date_available => "2015-11-18", :floors => 1, :term_number => 12, :term => "months"})

Dorm.create({:name => "Forest", :lat => 39.164757, :lng => -86.512474, :location => "Southeast", :phone => "812-855-5311", :email => "foresctr@indiana.edu", :address => "1725 East Third Street Bloomington, IN 47406-7509", :dorm_type => "Dorm", :floors => 11, :beds => "Down, Bunked", :rooms => "Single, Double", :bathrooms => "Community", :gender_on_floor => "Single, Split Gender", :description => "This residence hall is comprised of two 11-story towers connected by a center building. The center building includes resident mailboxes, a help desk, computer lab, dining hall, lounge, and much more. Forest has recently been renovated to add new dining, \"The Restaurants at Woodland\". This is Indiana University's newest dining option and consists of nine micro restaurants.", :price => "Average", :parking_zone => "D1", :academic_support_center => 1, :computer_lab => 1, :library => 0, :ud_academic_advising => 1, :ac => 1, :carpet_in_room => 1, :dining_onsite => 1, :music_practice_room => 1, :piano => 1, :dance_studio => 1, :exercise_room => 0, :game_room => 1, :laundry_on_floor => 0, :laundry_ground_floor => 1, :quiet_study_area => 1, :community_kitchen => 0, :iu_secure_wifi => 1})
