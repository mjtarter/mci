class Property < ActiveRecord::Base
	geocoded_by :address, :latitude => :lat, :longitude => :lng
	after_validation :geocode
end