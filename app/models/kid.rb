class Kid < ActiveRecord::Base
  has_one :bucket
  has_many :candies, through: :bucket


  def pig_out(number_of_candies)
    self.candies[0...number_of_candies].each { |c| c.destroy }
    number_of_candies > 2 ? feeling = "Sick" : feeling = "Happy"
    self.update(:feeling => feeling)
  end
end