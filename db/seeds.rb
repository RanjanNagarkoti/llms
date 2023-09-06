# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: 'john@gmail.com', password: 'Password1!', username: 'john', first_name: 'John', last_name: 'Doe')
User.create(email: 'john1@gmail.com', password: 'Password1!', role: 1, username: 'John1', first_name: 'John',
            last_name: 'Doe')
User.create(email: 'admin@gmail.com', password: 'Password1!', role: 2, username: 'Admin', first_name: 'John',
            last_name: 'Doe')
