class Kid < ActiveRecord::Base
  has_one :bucket

  def pig_out(consumption)
    self.bucket.candies[0...consumption].each do |candy|
      candy.destroy
    end
    consumption < 3 ? new_feeling = "Happy" : new_feeling = "Sick"
    self.update(:feeling => new_feeling)
  end
  
end