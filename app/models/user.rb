class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "90x90>" }

  has_many :reviews, :foreign_key => "owner_user_id"
  has_many :user_votes, :class_name => "UserVotes"
  has_many :actions, :foreign_key => "owner_user_id"
  has_many :medals, :class_name => "UserMedal"

  # Setup accessible (or protected) attributes for your model
  attr_accessible :fullname, :email, :password, :password_confirmation, :remember_me, :avatar

  after_create :initialize_points


	def set_flash txt
		@flash = txt;
	end

	def can_edit_place?
		if points > 1000
			true
		else
			false
		end
	end

	def add_medal type
		UserMedal.create({:user_id => self.id, :medal_id => Medal.find_by_code(type).id})	
	end

	def initialize_points
		self.points = 0
		save
	end

	def get_fullname
		if fullname.nil?
			email.split("@").first
		else
			fullname
		end

	end
end
