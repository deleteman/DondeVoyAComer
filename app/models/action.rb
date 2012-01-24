class Action < ActiveRecord::Base


	belongs_to :user, :foreign_key => "owner_user_id"
	@@action_types = [:new_place, :new_comment, :vote_up_comment, :vote_down_comment, :edit_place]

	attr_accessor :resulting_medal
    @action_attributes
	
	before_save :set_description
	after_save :check_for_medals


	def set_attributes options = {}
		@action_attributes = Hash.new if @action_attributes.nil?
		@action_attributes = options
	end

	 def set_description
		descriptions = {
		:new_place => "[[usuario]] ha creado un nuevo local: [[nombre_local]]",
		:comment_place =>  "[[usuario]] hizo un comentario sobre [[nombre_local]]",
		:upvote_comment => "A [[usuario]] le ha gustado el comentario de [[usuario2]] sobre [[nombre_local]]",
		:downvote_comment => "A [[usuario]] no le gust&oacute; el comentario de [[usuario2]] sobre [[nombre_local]]"}

		 new_desc = descriptions[code]

		 new_desc["[[usuario]]"] = user.get_fullname
		 #new_desc["[[usuario]]"] = link_to user, user.get_fullname
		 new_desc["[[usuario2]]"] = @action_attributes[:user2].get_fullname if !@action_attributes[:user2].nil?
		 new_desc["[[nombre_local]]"] = @action_attributes[:place].name if !@action_attributes[:place].nil?
		 self.description = new_desc

	 end

	 def check_for_medals
		 @resulting_medal = Array.new
		#first_time = (Action.find_all_by_code_and_owner_user_id ({:code => self.code, :owner_user_id => self.user.id}).count == 1)
		first_time = (Action.find_all_by_code_and_owner_user_id(self.code, self.user.id).count == 1)
		if code == :new_place
			if first_time
				@resulting_medal << self.user.add_medal(:first_place)
			end
		end

		 if code == :comment_place 
			 if first_time
				@resulting_medal << self.user.add_medal(:first_place)
			 end
		 end

		 # Need to change this, have to handle multiple medals at the same time
		 if code == :upvote_comment 
			 if first_time
				@resulting_medal << self.user.add_medal(:first_voted_comment)
		 end

		 if code == :downvote_comment
			 if first_time
				@resulting_medal << self.user.add_medal(:first_downvoted_comment)
			 end 
		 end


		end
	 end

end
