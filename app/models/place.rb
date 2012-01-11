class Place < ActiveRecord::Base
	has_attached_file :photo, :styles => {:medium => "300x300>", :thumb => "100x100>"}

	validates :name , :presence => true
	has_and_belongs_to_many :working_days
	has_many :reviews, :order => "votes DESC"
	self.per_page = 5

	#has_many :food_types

	def average_points *options 
		total_points = 0
		total_reviews = Array.new
		if options.count > 0
			if options.first == :masc
				total_reviews = reviews.select do |r|
					r.owner.sex == "M"
				end
			end
			if options.first == :fem
				total_reviews = reviews.select do |r|
					r.owner.sex == "F"
				end
			end

			if options.first == :age
				opt = options.last.to_s
				opts = opt.split("_")

				case opts.first
				when "less"
					total_reviews = reviews.select do |r|
						r.owner.age < Integer(opts.last)
					end
				when "between"
					total_reviews = reviews.select do |r|
						age = r.owner.age
						age <= Integer(opts.last) && age >= Integer(opts[1])
					end
				when "more"
					total_reviews = reviews.select do |r|
						r.owner.age > Integer(opts.last)
					end
				end
			end
		else
			total_reviews = reviews
		end

		total_reviews.each do |r|
			total_points += r.points
		end

		if total_reviews.length == 0
			return 0
		else
			return total_points / total_reviews.length
		end
	end

	def most_voted_review
		reviews.first	
	end
end
