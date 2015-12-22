class Property < ActiveRecord::Base
	geocoded_by :full_address, :latitude => :lat, :longitude => :lng
	before_validation :geocode

	def full_address
  		[address, city, state].compact.join(', ')
	end

	scope :by_price, -> (min, max)  { where("price > ? AND price < ?", min, max)}
	scope :approved, -> {where(approved: true)}

	belongs_to :user

	validates_presence_of :address
	validates_presence_of :city
	validates :city, format: { with: /\A[a-zA-Z]+\z/, message: "can only consist of letters" }
   	validates :city, length: { in: 2..30 }
	validates_presence_of :state
	validates_presence_of :property_type
	validates_acceptance_of :agreement
	validates_presence_of :lat

	validates :facility_name, :presence => true, :if => :active_or_basic_info?

	validates :phone, :presence => true, :if => :active_or_contact_info?

  
	before_save do |property|
		property.city = property.city.downcase.titleize
	end

	def active?
	  	status == 'active'
	end

	def active_or_basic_info?
    	status.include?('basic_info') || active?
  	end

  	def active_or_contact_info?
    	status.include?('contact_info') || active?
  	end

end