class Property < ActiveRecord::Base
	geocoded_by :address, :latitude => :lat, :longitude => :lng
	after_validation :geocode

	scope :by_price, -> (min, max)  { where("price > ? AND price < ?", min, max)}
end