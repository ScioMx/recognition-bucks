class User < ActiveRecord::Base
	attr_accessor :password
	before_save :encrypt_password

	validates :name, 
						presence: true
	validates :email, 
						uniqueness: true,
						presence: true, 	
						format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
	validates :password, 
						confirmation: true, 
						presence:true, 
						:on => :create

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
end
