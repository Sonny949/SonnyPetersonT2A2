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
Listing.destroy_all
Post.destroy_all

user = User.create(email: 'sonnypeterson949@hotmail.com', password: 'password', name: 'Sonny Peterson', phone_number: '2222222222')
user.add_role :admin

editor = User.create(email: '12046@coderacademy.edu.au', password: 'password', name: 'Max Power', phone_number: '4444444444')
editor.add_role :editor

user_address = Address.create(user_id: user.id, address_first: '123 Scoop St', address_second: 'Walkervale', city: 'Bundaberg', state: 'QLD', postcode: '4670')
editor_address = Address.create(user_id: editor.id, address_first: '116 Scoop St', address_second: 'Walkervale', city: 'Bundaberg', state: 'QLD', postcode: '4670')

boats = Category.create(name: 'Boats')
hulls = Category.create(name: 'Hulls')
engine = Category.create(name: 'Engines/Engine Spares')
run = Category.create(name: 'Running Gear')
safety = Category.create(name: 'Safety Gear')
props = Category.create(name: 'Propellers')
services = Category.create(name: 'Services')
other = Category.create(name: 'Other')

Post.create(title: 'New Addition to Rum City Powerboat Classic 2022', description: "There has been speculation of many additions to the Inboard Unlimited class for this year's Rum City Powerboat Classic. Sources allege that we could see a return of 'The General Lee'. This would add an exciting blown alcohol mix to an already deep field containing boats like the home-grown ls powered 'Sycko' and crowd favourite 'Image'. 

    The Rum City Powerboat Classic will be held on the 26-27th of June and entry is a gold coin donation.", user_id: User.first.id)
