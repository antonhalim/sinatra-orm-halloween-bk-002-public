class House < ActiveRecord::Base
  has_many :candies

  def give_candy(kid)
    if kid.age < 18
      unclaimed_candies.first.update(
        :bucket_id => kid.bucket.id
      ) 
    else
      "You're too old to trick-or-treat."
    end
  end

  def unclaimed_candies
    Candy.where(
      :house_id => self.id, 
      :bucket_id => nil
    )
  end
end