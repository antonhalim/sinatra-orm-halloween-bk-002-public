class House < ActiveRecord::Base
  has_many :candies

  def give_candy(kid)
    if kid.age < 17
      sweet = self.candies[0]
      kid.bucket.candies << sweet
    else
      "You're too old to trick-or-treat."
    end
  end
end