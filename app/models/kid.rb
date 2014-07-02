class Kid < ActiveRecord::Base
  has_one :bucket
  has_many :candies, :through => :bucket

  def pig_out(consumption)
    candy_count = self.bucket.candies.count
    if candy_count >= consumption
      self.bucket.candies[0...consumption].each do |candy|
        candy.destroy
      end
      if consumption > 3
        self.feeling = "Sick"
      else
        self.feeling = "Happy"
      end
      self.save
    else
      "You can't eat more candy than you have!"
    end
  end
end