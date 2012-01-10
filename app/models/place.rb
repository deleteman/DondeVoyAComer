class Place < ActiveRecord::Base
	has_attached_file :photo, :styles => {:medium => "300x300>", :thumb => "100x100>"}

	validates :name , :presence => true
	has_and_belongs_to_many :working_days
	has_many :reviews, :order => "votes DESC"
	self.per_page = 5

	#has_many :food_types

	def average_points
		total_points = 0
		reviews.each do |r|
			total_points += r.points
		end
		if reviews.length == 0
			return 0
		else
			return total_points / reviews.length
		end
	end

	def most_voted_review
		reviews.first	
	end
end
