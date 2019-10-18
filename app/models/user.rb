class User < ApplicationRecord
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  	mount_uploader :avatar, AvatarUploader

  	def is_admin?
  		return self.role == 'admin'
  	end

  	def set_admin
  		self.role = 'admin'
  		self.save
  	end
end
