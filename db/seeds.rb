# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create and attach avatars for users
user = User.new(
  email: Faker::Internet.email,
  password: 'Password1!',
  username: Faker::Internet.username,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
)

# Create a sample avatar file
avatar_file = File.open(Rails.root.join('app/assets/images/authentication/login-poster.png'))

# Attach the avatar and save the user
user.avatar.attach(
  io: avatar_file,
  filename: 'login-poster.png',
  content_type: 'image/png'
)
user.save

