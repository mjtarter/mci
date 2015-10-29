class Dorm < ActiveRecord::Base
	named_scope :with_user_data, {
    :select => "places.*, users.first_name, users.last_name",
    :joins => :user
  }
end
