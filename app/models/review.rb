class Review < ActiveRecord::Base
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_user_id"
	belongs_to :place
	validates :body, :presence => true, 
	  				 :length => {:minimum => 1, :maximum => 400}

	def user_voted_for_this? usr, vote_type
		 if vote_type == :down 
			points_given =-1
		else
			points_given =1
		end
		usr.user_votes.find(:all, :conditions => ["review_id = ? and user_id = ? and vote = ?", id, usr.id, points_given]).any? if !usr.nil?
	end

	def get_vote_from_user usr
		UserVotes.find_by_user_id_and_review_id  usr.id, id
	end
end
