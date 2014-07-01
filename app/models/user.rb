class User < ActiveRecord::Base
	validates :name, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }
	validates :entered_password, :length => { :minimum => 6 }
	validates :email, :uniqueness => true, :format => /.+@.+\..+/ 

	def self.authenticate(email, password)
		user = User.find_by_email(email)
		return user if user && (user.password == password)
		nil
	end
end
