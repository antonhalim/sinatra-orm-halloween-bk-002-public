class Candy < ActiveRecord::Base
  belongs_to :house
  belongs_to :bucket
end