# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Address.destroy_all
Category.destroy_all

user = User.create(email: 'sonny@test.com', password: 'password', name: 'Sonny Peterson', phone_number: '2222222222')

user_address = Address.create(user_id: user.id, address_first: '123 Scoop St', address_second: 'Walkervale', city: 'Bundaberg', state: 'QLD', postcode: '4670')

boats = Category.create(name: 'Boats')
hulls = Category.create(name: 'Hulls')
engine = Category.create(name: 'Engines/Engine Spares')
run = Category.create(name: 'Running Gear')
safety = Category.create(name: 'Safety Gear')
other = Category.create(name: 'Other')
