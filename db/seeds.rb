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

Post.create(title: "Taree Vintage Powerboat race to Run again in 2022", description: "The Taree Vintage powerboat race was inaugrated in 2019. It was brought about to get some of the beautiful vintage powerboats from around Australia out of the shed and on the water. The first meeting was a roaring success with boats coming from all over Aus. The event was created to coincide with a classic car and bike show and novelty race events to suit the whole family. Unfortunately the event hasn't run since due to covid-19. Great news is that the event is kicking off a gain this year on July 7th. The event is free entry for spectators.", user_id: User.last.id)

Post.create(title: "Dean Barry's new Boat Ramping up for a huge year", description: "Many of us in the Australian Powerboat community know the story. In 2010 over the course of one fateful weekend, we lost two legendary boats at the 60th anniversary Taree Easter Powerboat classic. Tragically, we lost Australian powerboating hero Brian McCosker and his unbeatable 'Liberty' on the Saturday. The racers all got together along with Brian's wife in the afternoon, and with her help it was decided that racing would commence the next day in memory of Brian. One of the racers in the open unlimited class was Dave Bryant from America. He was in Australia to test drive Dean Barry's fabled 'She's the Culprit' under race conditions with the intention of buying the boat and shipping it back to the U.S.A. Unfortunately Dave lost his life on the Sunday, and 'She's the Culprit' was no more. It was a truly terrible weekend for powerboat racing. Trying to leave the past behind, but also pay tribute to his masterpiece, Barry has completed work on a new Blown Alcohol Displacement (B.A.D) boat. Name? 'She's the Culprit II'. This time the boat was fitted out with a cockpit which was introduced as a must in response to the events of the 60th Taree classic. Barry has been plagued with setbacks and teething problems, but recently the boat has been showing promising speed and handling skills. Will we see it on top of the heap at the upcoming worlds in October?", user_id: User.first.id)
