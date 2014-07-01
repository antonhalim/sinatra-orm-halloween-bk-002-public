# TODO: write code in here to pre-load the database with houses and candy

# create kids
charlie = Kid.create(:name => "Charlie", :age => 14)
charlie.bucket = Bucket.new
lucy = Kid.create(:name => "Lucy", :age => 14)
lucy.bucket = Bucket.new

# create houses
cottage = House.create(:address=>"132 Seabridge Ln")
mansion = House.create(:address=>"10 Expensive Ave.")

# create candy
skittles = Candy.create(:name => "Skittles", :size => 3, :pieces => 20)
milkyway = Candy.create(:name => "Milkyway", :size => 2, :pieces => 2)
redhots = Candy.create(:name => "Redhots", :size => 2, :pieces => 10)
twix = Candy.create(:name => "Twix", :size => 2, :pieces => 2)
mints = Candy.create(:name => "Junior Mints", :size => 4, :pieces => 20)
sourpatch = Candy.create(:name => "Sour Patch Kids", :size => 3, :pieces => 15)

# assign candy
charlie.bucket.candies << [skittles, milkyway]
lucy.bucket.candies << redhots
mansion.candies << [twix, mints]
cottage.candies << sourpatch