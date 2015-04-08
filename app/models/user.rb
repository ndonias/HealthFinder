class User < ActiveRecord::Base
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  	has_many :articles

  	def admin?
  		self.admin == true ? true : false
  	end
end
