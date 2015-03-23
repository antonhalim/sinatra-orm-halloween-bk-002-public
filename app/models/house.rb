class House < ActiveRecord::Base
	has_many :candies

	def unclaimed_candies
		self.candies.select{|candy|	candy if candy.bucket_id.nil?}
	end

	def give_candy(kid)
		if kid.age < 18
			kid.bucket.candies << self.unclaimed_candies.first
			self.candies.first.bucket_id = kid.bucket.id
			return "Happy Halloween!"
		else
			return "You're too old to trick-or-treat."
		end
	end

end
