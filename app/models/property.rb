class Property < ActiveRecord::Base
	geocoded_by :full_address, :latitude => :lat, :longitude => :lng
	after_validation :geocode

	def full_address
  		[address, city, state].compact.join(', ')
	end

	scope :by_price, -> (min, max)  { where("price > ? AND price < ?", min, max)}
	scope :approved, -> {where(approved: true)}

	belongs_to :user

	validates_acceptance_of :agreement

end