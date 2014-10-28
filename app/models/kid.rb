class Kid < ActiveRecord::Base
  has_one :bucket

  def pig_out(num_of_candy_pieces)
    self.bucket.candies[0...num_of_candy_pieces].each do |candy|
      candy.destroy
    end
    num_of_candy_pieces < 3 ? new_feeling = "Happy" : new_feeling = "Sick"
    self.update(:feeling => new_feeling)
  end

end