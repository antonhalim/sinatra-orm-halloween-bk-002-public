class Bucket < ActiveRecord::Base
  belongs_to :kid
  has_many :candies
end