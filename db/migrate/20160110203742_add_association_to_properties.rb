class AddAssociationToProperties < ActiveRecord::Migration
  def change
  	#belong_to user
  	add_reference :properties, :user, index: true
  end
end