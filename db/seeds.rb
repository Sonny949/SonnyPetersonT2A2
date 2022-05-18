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
Shipment.destroy_all

admin = User.create(email: 'sonnypeterson949@hotmail.com', password: 'password', name: 'Sonny Peterson', phone_number: '2222222222')
admin.add_role :admin

user = User.create(email: 'bazzawild1@gmail.com', password: 'password', name: 'Bazza Wild')

editor = User.create(email: '12046@coderacademy.edu.au', password: 'password', name: 'Max Power', phone_number: '4444444444')
editor.add_role :editor

admin_address = Address.create(user_id: admin.id, address_first: '123 Scoop St', address_second: 'Walkervale', city: 'Bundaberg', state: 'QLD', postcode: '4670')
editor_address = Address.create(user_id: editor.id, address_first: '116 Scoop St', address_second: 'Walkervale', city: 'Bundaberg', state: 'QLD', postcode: '4670')
user_address = Address.create(user_id: user.id, address_first: '14 Shift St', address_second: 'Melton', city: 'Melbourne', state: 'VIC', postcode: '3338')

boats = Category.create(name: 'Boats')
hulls = Category.create(name: 'Hulls')
engine = Category.create(name: 'Engines/Engine Spares')
run = Category.create(name: 'Running Gear')
safety = Category.create(name: 'Safety Gear')
props = Category.create(name: 'Propellers')
services = Category.create(name: 'Services')
other = Category.create(name: 'Other')

post_one = Post.create(title: 'New Addition to Rum City Powerboat Classic 2022',  description: "There has been speculation of many additions to the Inboard Unlimited class for this year's Rum City Powerboat Classic. Sources allege that we could see a return of 'The General Lee'. This would add an exciting blown alcohol mix to an already deep field containing boats like the home-grown ls powered 'Sycko' and crowd favourite 'Image'. The Rum City Powerboat Classic will be held on the 26-27th of June and entry is a gold coin donation.", user_id: admin.id)
post_one.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "shestheculpritii.jpg")), filename: 'shestheculpritii.jpg' , content_type: "image/jpg")

post_two = Post.create(title: "Taree Vintage Powerboat race to Run again in 2022", description: "The Taree Vintage powerboat race was inaugrated in 2019. It was brought about to get some of the beautiful vintage powerboats from around Australia out of the shed and on the water. The first meeting was a roaring success with boats coming from all over Aus. The event was created to coincide with a classic car and bike show and novelty race events to suit the whole family. Unfortunately the event hasn't run since due to covid-19. Great news is that the event is kicking off a gain this year on July 7th. The event is free entry for spectators.", user_id: editor.id)
post_two.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "vintage_boat.jpg")), filename: 'vintage_boat.jpg' , content_type: "image/jpg")

post_three = Post.create(title: "Dean Barry's new Boat Ramping up for a huge year", description: "Many of us in the Australian Powerboat community know the story. In 2010 over the course of one fateful weekend, we lost two legendary boats at the 60th anniversary Taree Easter Powerboat classic. Tragically, we lost Australian powerboating hero Brian McCosker and his unbeatable 'Liberty' on the Saturday. The racers all got together along with Brian's wife in the afternoon, and with her help it was decided that racing would commence the next day in memory of Brian. One of the racers in the open unlimited class was Dave Bryant from America. He was in Australia to test drive Dean Barry's fabled 'She's the Culprit' under race conditions with the intention of buying the boat and shipping it back to the U.S.A. Unfortunately Dave lost his life on the Sunday, and 'She's the Culprit' was no more. It was a truly terrible weekend for powerboat racing. Trying to leave the past behind, but also pay tribute to his masterpiece, Barry has completed work on a new Blown Alcohol Displacement (B.A.D) boat. Name? 'She's the Culprit II'. This time the boat was fitted out with a cockpit which was introduced as a must in response to the events of the 60th Taree classic. Barry has been plagued with setbacks and teething problems, but recently the boat has been showing promising speed and handling skills. Will we see it on top of the heap at the upcoming worlds in October?", user_id: admin.id)
post_three.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "oxygen_thief.jpg")), filename: 'oxygen_thief.jpg' , content_type: "image/jpg")


listing_one = Listing.create(title: "Nascar Dodge Round Track full engine", price: 25000, shipment: true, user_id: admin.id, category_id: engine.id, description: "Carby fed Dodge Nascar Engine. 6.0 litre, naturally aspirated, making somewhere between 880 - 900 horsepower. 600 Newton-metres of torque. Email me with any further enquiries. Cash available if you intent to pick this up. As a great man once said 'I wanna go fast!'")
listing_one.images.attach(io: File.open(Rails.root.join("app", "assets", "images", "dodge_covers.jpg")), filename: 'dodge_covers.jpg' , content_type: "image/jpg")
listing_one.images.attach(io: File.open(Rails.root.join("app", "assets", "images", "nascar_dodge.jpg")), filename: 'nascar_dodge.jpg' , content_type: "image/jpg")

listing_two = Listing.create(title: "Evercraft shallow vee circuit race hull", price: 25000, shipment: false, user_id: editor.id, category_id: hulls.id, description: "Evercraft 17'6\" circuit race hull. Hand laid glass and the last of its kind before the vac pulled glass models. Fitted with safety cell and just had the bottom refurbished. Ready for race set up in either blown or 6.0 litre. Any questions just give me a call after 5pm on weekdays.") 
listing_two.images.attach(io: File.open(Rails.root.join("app", "assets", "images", "hostage_2.jpg")), filename: 'hostage_2.jpg' , content_type: "image/jpg")
listing_two.images.attach(io: File.open(Rails.root.join("app", "assets", "images", "hostage_reversed.jpg")), filename: 'hostage_reversed.jpg' , content_type: "image/jpg")

listing_three = Listing.create(title: "Flywheel from Dodge Nascar Engine", price: 1200, shipment: true, user_id: user.id, category_id: engine.id, description: "Flywheel from Dodge Nascar round track engine. Good condition. Give me a message or shoot me an email any time for more information.") 
listing_three.images.attach(io: File.open(Rails.root.join("app", "assets", "images", "flywheel.jpg")), filename: 'flywheel.jpg' , content_type: "image/jpg")

listing_four = Listing.create(title: "5.0l Everingham", price: 22000, shipment: false, user_id: admin.id, category_id: boats.id, description: "Multiple championship winning boat! Needs nothing done, just get on the water and race! Hull is a 15'6\" Everingham with a flat back end. Engine is a fully worked 5.0 litre Holden with everything done. Trailer is in great condition and comes with registration. All steering cables replaced, cav gear set to motor, everything balanced. If you need any more information just call or Email me.")
listing_four.images.attach(io: File.open(Rails.root.join("app", "assets", "images", "hot_lemon_egg.jpg")), filename: 'hot_lemon_egg.jpg' , content_type: "image/jpg")
listing_four.images.attach(io: File.open(Rails.root.join("app", "assets", "images", "hot_lemon_bank.jpg")), filename: 'hot_lemon_bank.jpg' , content_type: "image/jpg")