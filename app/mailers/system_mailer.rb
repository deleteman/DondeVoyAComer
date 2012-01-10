class SystemMailer < ActionMailer::Base
  default :from => "info@dondevoyacomer.com", :to => "info@dondevoyacomer.com"

	def home_message user, msg
		@msg = msg
		@user = user
		mail(:subject => "Mensaje [DONDE VOY A COMER]") 

	end

end
