class User < ActiveRecord::Base
	has_many :comments
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  	has_many :comments
  	has_many :articles

  	def admin?
  		self.admin == true ? true : false
  	end
end
