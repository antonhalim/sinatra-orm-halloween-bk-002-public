class Candy < ActiveRecord::Base
  belongs_to :bucket
  belongs_to :house
  delegate :kid, to: :bucket
end