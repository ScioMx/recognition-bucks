class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.password_hash == BCrypt::Engine.hash_secret(params[:password], user.password_salt)
			session[:user_id] = user.id
			redirect_to root_url, :notice => "Logged in!"
		else
			flash.now.alert = "Invalid email or password"
			render "new"
		end
	end

	def destroy
		session[:user_id]	= nil
		redirect_to root_url, :notice => "Logged out!"
	end

end