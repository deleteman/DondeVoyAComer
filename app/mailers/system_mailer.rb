class SystemMailer < ActionMailer::Base
  default :from => "deleteman@gmail.com", :to => "deleteman@gmail.com"

	def home_message user, msg
		@msg = msg
		@user = user
		mail(:subject => "Mensaje [DONDE VOY A COMER]") 

	end

end
