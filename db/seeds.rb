# create kids
charlie = Kid.create(:name => "Charlie", :age => 8)
charlie.bucket = Bucket.new
lucy = Kid.create(:name => "Lucy", :age => 10)
lucy.bucket = Bucket.new
patty = Kid.create(:name => "Patty", :age => 9)
patty.bucket = Bucket.new

# create houses
cottage = House.create(:address=>"132 Seabridge Ln")
mansion = House.create(:address=>"10 Expensive Ave.")
split_level = House.create(:address=>"142 Tennessee St.")

# create candy for houses
skittles = Candy.create(:name => "Skittles", :size => 3, :pieces => 20)
milkyway = Candy.create(:name => "Milkyway", :size => 2, :pieces => 2)
redhots = Candy.create(:name => "Redhots", :size => 2, :pieces => 10)
twix = Candy.create(:name => "Twix", :size => 2, :pieces => 2)
mints = Candy.create(:name => "Junior Mints", :size => 4, :pieces => 20)
sourpatch = Candy.create(:name => "Sour Patch Kids", :size => 3, :pieces => 15)

# create candy for kids & houses
snickers = Candy.create(:name => "Snickers", :size => 3, :pieces => 1)
almondjoy = Candy.create(:name => "Almond Joy", :size => 3, :pieces => 2)
snocaps = Candy.create(:name => "Snocaps", :size => 3, :pieces => 17)
take5 = Candy.create(:name => "Take 5", :size => 3, :pieces => 1)
kitkat = Candy.create(:name => "Kit Kat", :size => 3, :pieces => 3)
hershey = Candy.create(:name => "Hershey", :size => 3, :pieces => 1)
mr_good = Candy.create(:name => "Mr. Good Bar", :size => 3, :pieces => 1)

# assign candy to houses
mansion.candies << [twix, mints, milkyway, redhots, mr_good]
cottage.candies << [sourpatch, skittles, hershey]
split_level.candies << [snickers, almondjoy, snocaps, take5, kitkat]

# assign candy to kids
charlie.bucket.candies << [twix, sourpatch, snickers]
lucy.bucket.candies << [mints, skittles]
patty.bucket.candies << almondjoy



