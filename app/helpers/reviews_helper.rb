module ReviewsHelper

	def self.check_for_resulting_medals action, flash
		flash[:medals] = Array.new if !flash[:medals].kind_of?(Array)

		if !action.resulting_medal.nil?
			action.resulting_medal.each do |m|
				flash[:medals] << "<h2>Felicitaciones</h2> Has conseguido la #{m.medal.name}	"
			end
		end
	end
end
