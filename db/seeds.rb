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
c = 1
u = User.new(email: "mail@mail.com", password: "password")
u.save!
p u
4.times do
  User.create!(email: "#{c}mail@mail.com", password: "password")
  c += 1
end

puts "creating categories"

Category.create(name: "tops")
Category.create(name: "bottoms")
Category.create(name: "shoes")
Category.create(name: "accessories")

puts Category.all

puts "creating items"

green_sweater = Item.new(user: User.all.sample)
green_sweater.category = Category.all[0]
green_sweater.color = "#36473F"
green_sweater.image.attach(io: File.open("app/assets/images/demoseeds/green_sweater.png"), filename: "green_sweater.png", content_type: "image/png")
green_sweater.save!

blue_pants = Item.new(user: User.all.sample)
blue_pants.category = Category.all[1]
blue_pants.color = "#4287f5"
blue_pants.image.attach(io: File.open("app/assets/images/blue_pants.jpg"), filename: "blue_pants.jpg", content_type: "image/jpg")
blue_pants.save!

yellow_shoes = Item.new(user: User.all.sample)
yellow_shoes.category = Category.all[2]
yellow_shoes.color = "#ffff30"
yellow_shoes.image.attach(io: File.open("app/assets/images/yellow_shoes.jpg"), filename: "yellow_shoes.jpg", content_type: "image/jpg")
yellow_shoes.save!

black_belt = Item.new(user: User.all.sample)
black_belt.category = Category.all[3]
black_belt.color = "#2e2e2e"
black_belt.image.attach(io: File.open("app/assets/images/demoseeds/black_belt.png"), filename: "black_belt.png", content_type: "image/png")
black_belt.save!

yellow_vans = Item.new(user: User.all.sample)
yellow_vans.category = Category.all[3]
yellow_vans.color = "#ffff30"
yellow_vans.image.attach(io: File.open("app/assets/images/demoseeds/yellow_vans.png"), filename: "yellow_vans.png", content_type: "image/png")
yellow_vans.save!

red_tshirt = Item.new(user: User.all.sample)
red_tshirt.category = Category.all[3]
red_tshirt.color = "#55232D"
red_tshirt.image.attach(io: File.open("app/assets/images/demoseeds/red_tshirt.png"), filename: "red_tshirt.png", content_type: "image/png")
red_tshirt.save!


red_tshirt2 = Item.new(user: User.all.sample)
red_tshirt2.category = Category.all[3]
red_tshirt2.color = "#bf1f21"
red_tshirt2.image.attach(io: File.open("app/assets/images/demoseeds/red_tshirt2.png"), filename: "red_tshirt2.png", content_type: "image/png")
red_tshirt2.save!


red_shoes = Item.new(user: User.all.sample)
red_shoes.category = Category.all[3]
red_shoes.color = "#791C19"
red_shoes.image.attach(io: File.open("app/assets/images/demoseeds/red_shoes.png"), filename: "red_shoes.png", content_type: "image/png")
red_shoes.save!


red_nike = Item.new(user: User.all.sample)
red_nike.category = Category.all[3]
red_nike.color = "#bf1f21"
red_nike.image.attach(io: File.open("app/assets/images/demoseeds/red_nike.png"), filename: "red_nike.png", content_type: "image/png")
red_nike.save!

green_hat = Item.new(user: User.all.sample)
green_hat.category = Category.all[3]
green_hat.color = "#4B4E38"
green_hat.image.attach(io: File.open("app/assets/images/demoseeds/green_hat.png"), filename: "green_hat.png", content_type: "green_hat/png")
green_hat.save!

grey_pants = Item.new(user: User.all.sample)
grey_pants.category = Category.all[3]
grey_pants.color = "#5a5c5a"
grey_pants.image.attach(io: File.open("app/assets/images/demoseeds/grey_pants.png"), filename: "grey_pants.png", content_type: "grey_pants/png")
grey_pants.save!

dark_grey_shorts = Item.new(user: User.all.sample)
dark_grey_shorts.category = Category.all[3]
dark_grey_shorts.color = "#5a5c5a"
dark_grey_shorts.image.attach(io: File.open("app/assets/images/demoseeds/dark_grey_shorts.png"), filename: "dark_grey_shorts.png", content_type: "dark_grey_shorts/png")
dark_grey_shorts.save!

blue_tshirt = Item.new(user: User.all.sample)
blue_tshirt.category = Category.all[3]
blue_tshirt.color = "#1970CA"
blue_tshirt.image.attach(io: File.open("app/assets/images/demoseeds/blue_tshirt.png"), filename: "blue_tshirt.png", content_type: "blue_tshirt/png")
blue_tshirt.save!

blue_tshirt2 = Item.new(user: User.all.sample)
blue_tshirt2.category = Category.all[3]
blue_tshirt2.color = "#424975"
blue_tshirt2.image.attach(io: File.open("app/assets/images/demoseeds/blue_tshirt2.png"), filename: "blue_tshirt2.png", content_type: "blue_tshirt2/png")
blue_tshirt2.save!
puts Item.all
