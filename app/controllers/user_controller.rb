class UserController < ApplicationController
	def taotaikhoan
	    u = User.where(:email => "tony@vinova.sg").first || User.new
	    u.email = "tony@gmail.com"
	    u.password = "12345678"
	    u.save
	end
end
