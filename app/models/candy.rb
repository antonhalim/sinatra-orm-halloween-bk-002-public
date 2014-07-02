class Candy < ActiveRecord::Base
  belongs_to :bucket
  belongs_to :house
end