class ContactLandlordMailer < ActionMailer::Base
 	default from: "from@example.com"
	
	def landlord_email(first_name, last_name, phone, email, message)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@phone = phone
		@message = message

    	mail(to: 'matt@denverwebco.com', subject: 'Property Interest')
  	end
end