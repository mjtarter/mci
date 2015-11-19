class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
    	t.string :property_type, :null => false
    	t.string :address, :null => false
        t.string :city, :null => false
        t.string :state, :null => false
    	t.float :lat
    	t.float :lng
    	t.string :bedrooms
    	t.string :baths
    	t.decimal :price, :precision => 6, :scale => 2
    	t.decimal :price_two, :precision => 6, :scale => 2
    	t.boolean :availability
        t.date :date_available
    	t.integer :floors
        t.integer :term_number
    	t.string :term
    	t.integer :sqft
    	t.string :description
    	t.string :facility_name
    	t.string :property_manager
    	t.string :office_address
    	t.string :office_hours
    	t.string :phone
    	t.string :email
    	t.string :website
    	t.string :facebook
    	t.boolean :ac
    	t.boolean :microwave
    	t.boolean :refrigerator
    	t.boolean :washer_dryer
    	t.boolean :dishwasher
    	t.boolean :garbage_disposal
    	t.boolean :patio_balcony
    	t.boolean :walk_in_closets
    	t.boolean :locking_room_doors
    	t.boolean :storage_space
    	t.boolean :furnished
    	t.boolean :ceiling_fans
    	t.boolean :electric_gas
    	t.boolean :trash
    	t.boolean :water
    	t.boolean :cable
    	t.boolean :internet
    	t.boolean :dogs_allowed
    	t.boolean :cats_allowed
    	t.boolean :other_pets_allowed
    	t.boolean :laundry_facilities
    	t.boolean :computer_lab
    	t.boolean :fitness_center
    	t.boolean :lounge
    	t.boolean :controlled_access
    	t.boolean :swimming_pool
    	t.boolean :on_site_maintenance
    	t.boolean :courtyard
    	t.boolean :parking
    	t.boolean :resident_functions
    	t.boolean :on_bus_route
    	t.boolean :elevator
    	t.boolean :additional_amenities
      t.timestamps null: false
    end
  end
end
