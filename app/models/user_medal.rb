class UserMedal < ActiveRecord::Base
	belongs_to :user
	belongs_to :medal
end
