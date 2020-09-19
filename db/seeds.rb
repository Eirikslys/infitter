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

green_jacket = Item.new(user: User.all.sample)
green_jacket.category = Category.all[0]
green_jacket.color = "green"
green_jacket.image.attach(io: File.open("app/assets/images/green_jacket.jpg"), filename: "green_jacket.jpg", content_type: "image/jpg")
green_jacket.save!

blue_pants = Item.new(user: User.all.sample)
blue_pants.category = Category.all[1]
blue_pants.color = "blue"
blue_pants.image.attach(io: File.open("app/assets/images/blue_pants.jpg"), filename: "blue_pants.jpg", content_type: "image/jpg")
blue_pants.save!

yellow_shows = Item.new(user: User.all.sample)
yellow_shows.category = Category.all[2]
yellow_shows.color = "yellow"
yellow_shows.image.attach(io: File.open("app/assets/images/yellow_shoes.jpg"), filename: "yellow_shoes.jpg", content_type: "image/jpg")
yellow_shows.save!

black_belt = Item.new(user: User.all.sample)
black_belt.category = Category.all[3]
black_belt.color = "black"
black_belt.image.attach(io: File.open("app/assets/images/black_belt.jpg"), filename: "black_belt.jpg", content_type: "image/jpg")
black_belt.save!

puts Item.all
