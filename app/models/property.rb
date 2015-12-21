class Property < ActiveRecord::Base
	geocoded_by :full_address, :latitude => :lat, :longitude => :lng
	after_validation :geocode

	def full_address
  		[address, city, state].compact.join(', ')
	end

	scope :by_price, -> (min, max)  { where("price > ? AND price < ?", min, max)}
	scope :approved, -> {where(approved: true)}

	belongs_to :user

	validates_presence_of :address
	validates_presence_of :city
	validates :city, format: { with: /\A[a-zA-Z]+\z/, message: "can only consist of letters" }
   	validates :city, length: { in: 2..30 }, :if => :city_format_passes
	validates_presence_of :state
	validates_presence_of :property_type
	validates_acceptance_of :agreement
	validates_presence_of :lat

	def city_format_passes
		@property.errors.invalid?(:city) == true
	end

end