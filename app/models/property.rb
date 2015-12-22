class Property < ActiveRecord::Base
	
	belongs_to :user

	scope :by_price, -> (min, max)  { where("price > ? AND price < ?", min, max)}
	scope :approved, -> {where(approved: true)}

	geocoded_by :full_address, :latitude => :lat, :longitude => :lng
	before_validation :geocode

	validates_presence_of :address
	validates_presence_of :city
	validates :city, format: { with: /\A[a-zA-Z]+\z/, message: "can only consist of letters" }
   	validates :city, length: { in: 2..30 }
	validates_presence_of :state
	validates_presence_of :property_type
	validates_acceptance_of :agreement
	validates_presence_of :lat
	validates :bedrooms, :presence => true, :if => :active_or_basic_info?
	validates :baths, :presence => true, :if => :active_or_basic_info?
	validates :price, :presence => true, :if => :active_or_basic_info?
	validates :term, :presence => true, :if => :active_or_basic_info?
	validates :term_number, :presence => true, :if => :active_or_basic_info?
	validates_inclusion_of :availability, :in => [true, false], :if => :active_or_basic_info?
	validates_numericality_of :sqft, :only_integer => true, allow_blank: true
	validates :sqft, length: { in: 3..5 }, allow_blank: true
	validates :facility_name, length: { in: 2..25 }, allow_blank: true
	validates :property_manager, length: { in: 2..25 }, allow_blank: true
	validates_numericality_of :price, :only_integer => true, allow_blank: true
	validates_numericality_of :price_two, :only_integer => true, allow_blank: true
	validates :price, length: { in: 3..5 }, allow_blank: true
	validates :price_two, length: { in: 3..5 }, allow_blank: true
	validates_numericality_of :price_two, :greater_than => :price, allow_blank: true
	validate :date_available_cannot_be_in_the_past

	before_save do |property|
		property.city = property.city.downcase.titleize
	end

	def full_address
  		[address, city, state].compact.join(', ')
	end
		
	def date_available_cannot_be_in_the_past
    	errors.add(:date_available, "can't be in the past") if
    	!date_available.blank? and date_available < Date.today
  	end
	
	#Run Validation if status is active or if current page == the step listed. Necessary for validations of multi-step form.  
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