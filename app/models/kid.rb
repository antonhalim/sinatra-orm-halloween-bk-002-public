class Kid < ActiveRecord::Base
  has_one :bucket

  def pig_out(num_of_candies)
    self.bucket.candies[0...num_of_candies].each do |candy|
      candy.destroy
    end
    num_of_candies < 3 ? new_feeling = "Happy" : new_feeling = "Sick"
    self.update(:feeling => new_feeling)
  end

end