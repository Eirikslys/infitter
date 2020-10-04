# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# before seeding it wipes out database entries.
puts "deleting items"
 Item.destroy_all
puts "items destroyed"

puts "deleting categories"
 Category.destroy_all
puts "categories destroyed"

puts "deleting users"
 User.destroy_all
puts "users destroyed"

# Generate some users, they are identical but with a number from 1 to 5 before their email.
puts "creating users"
user = User.new(email: "mail@mail.com", password: "password")
user.save!



puts "creating categories"

Category.create(name: "tops")
Category.create(name: "bottoms")
Category.create(name: "shoes")
Category.create(name: "accessories")

puts Category.all

puts "creating items"

green_sweater = Item.new(user: user)
green_sweater.category = Category.all[0]
green_sweater.color = "#566e4f"
green_sweater.image.attach(io: File.open("app/assets/images/demoseeds/green_sweater.png"), filename: "green_sweater.png", content_type: "image/png")
green_sweater.save!

green_hat = Item.new(user: user)
green_hat.category = Category.all[3]
green_hat.color = "#566e4f"
green_hat.image.attach(io: File.open("app/assets/images/demoseeds/green_hat.png"), filename: "green_hat.png", content_type: "green_hat/png")
green_hat.save!

green_shirt = Item.new(user: user)
green_shirt.category = Category.all[0]
green_shirt.color = "#566e4f"
green_shirt.image.attach(io: File.open("app/assets/images/demoseeds/green_shirt.png"), filename: "green_shirt.png", content_type: "green_shirt/png")
green_shirt.save!

yellow_shoes = Item.new(user: user)
yellow_shoes.category = Category.all[2]
yellow_shoes.color = "#fcc80a"
yellow_shoes.image.attach(io: File.open("app/assets/images/yellow_shoes.jpg"), filename: "yellow_shoes.jpg", content_type: "image/jpg")
yellow_shoes.save!

yellow_vans = Item.new(user: user)
yellow_vans.category = Category.all[2]
yellow_vans.color = "#fcc80a"
yellow_vans.image.attach(io: File.open("app/assets/images/demoseeds/yellow_vans.png"), filename: "yellow_vans.png", content_type: "image/png")
yellow_vans.save!

yellow_sweater = Item.new(user: user)
yellow_sweater.category = Category.all[0]
yellow_sweater.color = "#fcc80a"
yellow_sweater.image.attach(io: File.open("app/assets/images/demoseeds/yellow_sweater.png"), filename: "yellow_sweater.png", content_type: "image/png")
yellow_sweater.save!

black_pants = Item.new(user: user)
black_pants.category = Category.all[1]
black_pants.color = "#2e2e2e"
black_pants.image.attach(io: File.open("app/assets/images/demoseeds/black_pants.png"), filename: "black_pants.png", content_type: "image/png")
black_pants.save!

black_belt = Item.new(user: user)
black_belt.category = Category.all[3]
black_belt.color = "#2e2e2e"
black_belt.image.attach(io: File.open("app/assets/images/demoseeds/black_belt.png"), filename: "black_belt.png", content_type: "image/png")
black_belt.save!

maroon_tshirt = Item.new(user: user)
maroon_tshirt.category = Category.all[0]
maroon_tshirt.color = "#55232D"
maroon_tshirt.image.attach(io: File.open("app/assets/images/demoseeds/maroon_tshirt.png"), filename: "maroon_tshirt.png", content_type: "image/png")
maroon_tshirt.save!

maroon_sweater = Item.new(user: user)
maroon_sweater.category = Category.all[0]
maroon_sweater.color = "#55232D"
maroon_sweater.image.attach(io: File.open("app/assets/images/demoseeds/maroon_sweater.png"), filename: "maroon_sweater.png", content_type: "image/png")
maroon_sweater.save!

maroon_vans = Item.new(user: user)
maroon_vans.category = Category.all[2]
maroon_vans.color = "#55232D"
maroon_vans.image.attach(io: File.open("app/assets/images/demoseeds/maroon_vans.png"), filename: "maroon_vans.png", content_type: "image/png")
maroon_vans.save!

grey_pants = Item.new(user: user)
grey_pants.category = Category.all[1]
grey_pants.color = "#5a5c5a"
grey_pants.image.attach(io: File.open("app/assets/images/demoseeds/grey_pants.png"), filename: "grey_pants.png", content_type: "grey_pants/png")
grey_pants.save!

dark_grey_shorts = Item.new(user: user)
dark_grey_shorts.category = Category.all[1]
dark_grey_shorts.color = "#5a5c5a"
dark_grey_shorts.image.attach(io: File.open("app/assets/images/demoseeds/dark_grey_shorts.png"), filename: "dark_grey_shorts.png", content_type: "dark_grey_shorts/png")
dark_grey_shorts.save!

blue_tshirt = Item.new(user: user)
blue_tshirt.category = Category.all[0]
blue_tshirt.color = "#1970CA"
blue_tshirt.image.attach(io: File.open("app/assets/images/demoseeds/blue_tshirt.png"), filename: "blue_tshirt.png", content_type: "blue_tshirt/png")
blue_tshirt.save!

blue_hat = Item.new(user: user)
blue_hat.category = Category.all[3]
blue_hat.color = "#1970CA"
blue_hat.image.attach(io: File.open("app/assets/images/demoseeds/blue_hat.png"), filename: "blue_hat.png", content_type: "blue_hat/png")
blue_hat.save!

blue_sweater = Item.new(user: user)
blue_sweater.category = Category.all[0]
blue_sweater.color = "#1970CA"
blue_sweater.image.attach(io: File.open("app/assets/images/demoseeds/blue_sweater.png"), filename: "blue_sweater.png", content_type: "blue_sweater/png")
blue_sweater.save!

orange_sweater = Item.new(user: user)
orange_sweater.category = Category.all[0]
orange_sweater.color = "#ED7733"
orange_sweater.image.attach(io: File.open("app/assets/images/demoseeds/orange_sweater.png"), filename: "orange_sweater.png", content_type: "orange_sweater/png")
orange_sweater.save!
puts Item.all

orange_tshirt = Item.new(user: user)
orange_tshirt.category = Category.all[0]
orange_tshirt.color = "#ED7733"
orange_tshirt.image.attach(io: File.open("app/assets/images/demoseeds/orange_tshirt.png"), filename: "orange_tshirt.png", content_type: "orange_tshirt/png")
orange_tshirt.save!
puts Item.all

orange_hat = Item.new(user: user)
orange_hat.category = Category.all[3]
orange_hat.color = "#ED7733"
orange_hat.image.attach(io: File.open("app/assets/images/demoseeds/orange_hat.png"), filename: "orange_hat.png", content_type: "orange_hat/png")
orange_hat.save!
puts Item.all



