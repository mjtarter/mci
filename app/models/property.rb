class Property < ActiveRecord::Base
	
	belongs_to :user

	scope :by_rent, -> (min, max)  { where("rent > ? AND rent < ?", min, max)}
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
	validates :rent, :presence => true, :if => :active_or_basic_info?
	validates :term, :presence => true, :if => :active_or_basic_info?
	validates :term_number, :presence => true, :if => :active_or_basic_info?
	validates :availability, inclusion: { :in => [true, false], :if => :active_or_basic_info? }
	validates_numericality_of :sqft, :only_integer => true, allow_blank: true
	validates :sqft, length: { in: 3..5 }, allow_blank: true
	validates :facility_name, length: { in: 2..25 }, allow_blank: true
	validates :property_manager, length: { in: 2..25 }, allow_blank: true
	validates_numericality_of :rent, :only_integer => true, allow_blank: true
	validates_numericality_of :rent_two, :only_integer => true, :greater_than => :rent, allow_blank: true
	validates :rent, length: { in: 3..5 }, allow_blank: true
	validates :rent_two, length: { in: 3..5 }, allow_blank: true
	validate :date_available_cannot_be_in_the_past
	validates :phone, numericality: { only_integer: true }, length: { is: 10 }, allow_blank: true, :if => :active_or_contact_info?
	validates_presence_of :email, :if => :active_or_contact_info?
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :if => :active_or_contact_info?
	validates_presence_of :description, :if => :active_or_description?
	validates :description, length: { in: 20..500 }, :if => :active_or_description?
	validates_inclusion_of :ac, :in => [true, false], :if => :active_or_amenities?
	validates_inclusion_of :microwave, :in => [true, false], :if => :active_or_amenities?
	validates_inclusion_of :refrigerator, :in => [true, false], :if => :active_or_amenities?
	validates_inclusion_of :washer_dryer, :in => [true, false], :if => :active_or_amenities?
	validates_inclusion_of :dishwasher, :in => [true, false], :if => :active_or_amenities?
	validates_inclusion_of :garbage_disposal, :in => [true, false], :if => :active_or_amenities?
	validates_inclusion_of :patio_balcony, :in => [true, false], :if => :active_or_amenities?
	validates_inclusion_of :walk_in_closets, :in => [true, false], :if => :active_or_amenities?
	validates_inclusion_of :locking_room_doors, :in => [true, false], :if => :active_or_amenities?
	validates_inclusion_of :storage_space, :in => [true, false], :if => :active_or_amenities?
	validates_inclusion_of :furnished, :in => [true, false], :if => :active_or_amenities?
	validates_inclusion_of :ceiling_fans, :in => [true, false], :if => :active_or_amenities?
	validates_inclusion_of :laundry_facilities, :in => [true, false], :if => :active_or_community_features?
	validates_inclusion_of :computer_lab, :in => [true, false], :if => :active_or_community_features?
	validates_inclusion_of :fitness_center, :in => [true, false], :if => :active_or_community_features?
	validates_inclusion_of :lounge, :in => [true, false], :if => :active_or_community_features?
	validates_inclusion_of :controlled_access, :in => [true, false], :if => :active_or_community_features?
	validates_inclusion_of :swimming_pool, :in => [true, false], :if => :active_or_community_features?
	validates_inclusion_of :on_site_maintenance, :in => [true, false], :if => :active_or_community_features?
	validates_inclusion_of :courtyard, :in => [true, false], :if => :active_or_community_features?
	validates_inclusion_of :parking, :in => [true, false], :if => :active_or_community_features?
	validates_inclusion_of :resident_functions, :in => [true, false], :if => :active_or_community_features?
	validates_inclusion_of :on_bus_route, :in => [true, false], :if => :active_or_community_features?
	validates_inclusion_of :elevator, :in => [true, false], :if => :active_or_community_features?

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
	  	status.to_s == 'active'
	end

	def active_or_basic_info?
    	status.to_s.include?('basic_info') || active?
  	end

  	def active_or_contact_info?
    	status.to_s.include?('contact_info') || active?
  	end

  	def active_or_description?
    	status.to_s.include?('description') || active?
  	end

  	def active_or_amenities?
    	status.to_s.include?('amenities') || active?
  	end

  	def active_or_community_features?
  		if property_type == "Apartment"
    		status.to_s.include?('community_features') || active?
    	end
  	end

end