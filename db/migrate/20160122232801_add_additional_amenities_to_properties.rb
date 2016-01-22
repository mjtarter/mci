class AddAdditionalAmenitiesToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :additional_amenity_one, :string
  	add_column :properties, :additional_amenity_two, :string
  	add_column :properties, :additional_amenity_three, :string
  	add_column :properties, :additional_amenity_four, :string
  	add_column :properties, :additional_amenity_five, :string
  	add_column :properties, :additional_amenity_six, :string
  	add_column :properties, :additional_amenity_seven, :string
  	add_column :properties, :additional_amenity_eight, :string
  	add_column :properties, :additional_amenity_nine, :string
  	add_column :properties, :additional_amenity_ten, :string
  end
end
