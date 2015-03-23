class Kid < ActiveRecord::Base
	has_one :bucket
	has_many :candies, through: :bucket

	def pig_out(num)
		num.times do
			self.bucket.candies.first.delete
		end

		if num <= 2
			self.feeling = "Happy"
			self.save
		else
			self.feeling = "Sick"
			self.save
		end
	end





end
