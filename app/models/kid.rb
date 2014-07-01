class Kid < ActiveRecord::Base
  has_one :bucket
  has_many :candies, :through => :bucket
end