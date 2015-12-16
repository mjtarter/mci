class ContactMailer < ActionMailer::Base
  default from: "from@example.com"
def sample_email(first_name, last_name, email, message)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@message = message

    mail(to: 'matt@denverwebco.com', subject: 'MCI Contact Form')
  end
end