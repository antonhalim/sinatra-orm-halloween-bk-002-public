class House < ActiveRecord::Base
  has_many :candies

  def give_candy(kid)
    if kid.age >= 18
      "You're too old to trick-or-treat."
    else
      choosen_candy = unclaimed_candies.first
      choosen_candy.update(:bucket_id => kid.bucket.id)
      "Happy Halloween!"
    end
  end

  def unclaimed_candies
    Candy.where(
      :bucket_id => nil,
      :house_id => self.id
    )
  end
end