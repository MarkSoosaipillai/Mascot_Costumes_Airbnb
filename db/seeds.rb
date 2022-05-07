# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "date"
puts "Destroying previous data"
Reservation.destroy_all
Costume.destroy_all
User.destroy_all

15.times do
    puts "Creating new users"
     p admin = User.create(name: 'Andrii', email: 'andrii@gmail.com', password: 'password')
     p new_user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8, max_length: 10))
     admin.save
     new_user.save
end

#Retrieving the list of all user ids
p user_ids_list = User.all.pluck(:id)


puts "Creating new costumes"
imageArray = ["chiitan.jpg", "ford.jpg", "gritty.jpg", "mickey.jpg", "unicorn.jpg"]
MTL_ADDRESSES = [
    '7503 Rue St Denis, Montreal QC',
    '251 Av Percival Montreal Ouest QC',
    '11727 Rue Notre Dame E, Montreal QC',
    '3708 Rue St Hubert, Montreal QC',
    '800 Rue Gagne Lasalle QC',
    '16 Saint-Viateur O., Montreal QC',
    '4107 Boulevard Saint-Laurent, Montreal QC',
    '5930 Rue Hurteau, Montreal QC',
    '6730 44 Av, Montreal QC',
    '1940 Jolicoeur Street, Montreal QC',
    '5240 Randall Av, Montreal QC',
    '3555 Edouard-Montpetit, Montreal QC',
    '12225 Av de Saint-Castin, Montreal QC',
    '391 Rue de la Congrégation, Montreal QC'
  ]
  puts  "Creating Costumes"

  p chiitan = Costume.create(name: "Chiitan", descr: "Mischievous japanese mascot!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                              size: %w(Small Medium Large).sample(1)[0], category:"Cartoon", user_id:  user_ids_list.sample(1)[0],
                              image: "chiitan.jpg" )
    chiitan.save

    p pink_dragron = Costume.create(name: "Pink Dragon", descr: "Chinese style!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                                    size: %w(Small Medium Large).sample(1)[0], category:"Animal", user_id:  user_ids_list.sample(1)[0],
                                    image: "chinese costume.jpg" )
     pink_dragron.save

    p football_fan = Costume.create(name: "Rowdy", descr: "For american football fans!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                                    size: %w(Small Medium Large).sample(1)[0], category:"Sports", user_id:  user_ids_list.sample(1)[0],
                                    image:"ford.jpg" )
      football_fan.save
    p gritty = Costume.create(name: "Gritty", descr: "Nice, but a little crazy!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                                    size: %w(Small Medium Large).sample(1)[0], category:"Sports", user_id:  user_ids_list.sample(1)[0],
                                    image: "gritty.jpg"  )
      gritty.save
    p mickey = Costume.create(name: "Mickey", descr: "Perfect for your special day!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                              size: %w(Small Medium Large).sample(1)[0], category:"Wedding", user_id:  user_ids_list.sample(1)[0],
                              image: "mickey.jpg"  )
      mickey.save
    p panda = Costume.create(name: "Cool Panda", descr: "Great for birthday parties!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                              size: %w(Small Medium Large).sample(1)[0], category:"Wedding", user_id:  user_ids_list.sample(1)[0],
                              image: "panda.jpg"  )
      panda.save
    p unicorn = Costume.create(name: "Rainbow Dash", descr: "Perfect for tall people!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                              size: "Large", category:"Animal", user_id:  user_ids_list.sample(1)[0],
                              image: "unicorn.jpg"  )
      unicorn.save
    p coffee = Costume.create(name: "Mr. Coffee", descr: "Show your &#10084;&#65039; for coffee!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                              size: %w(Small Medium Large).sample(1)[0], category:"Corporate", user_id:  user_ids_list.sample(1)[0],
                              image: "coffee_cup.jpg"  )
      if !coffee.valid?
        puts coffee.errors.full_messages
      end
      coffee.save
    p lobster = Costume.create(name: "Sophie the lobster", descr: "Who doesn't like lobsters?!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                              size: %w(Small Medium Large).sample(1)[0], category:"Animal", user_id:  user_ids_list.sample(1)[0],
                              image: "panda.jpg"  )
      lobster.save
      p youpi = Costume.create(name: "Youpi!", descr: "Everyone's favourite!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                                size: %w(Small Medium Large).sample(1)[0], category:"Corporate", user_id:  user_ids_list.sample(1)[0],
                                image: "youpi.jpg"  )
      youpi.save

# 10.times do
#     p new_costume =  Costume.create(name: ["Chiitan", "Gritty", "Youpi!", "Mickey", "Rainbow Dash"].sample(1)[0], descr: Faker::Lorem.sentence(word_count: 10, supplemental: true), address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
#                                   size: %w(Small Medium Large).sample(1)[0], category: %w(Corporate Animal Sports Cartoon Wedding).sample(1)[0], user_id:  user_ids_list.sample(1)[0],
#                                   image:imageArray.sample(1)[0])
#     new_costume.save
# end
#Retrieving the list of all mascot ids
p mascot_ids_list = Costume.all.pluck(:id)

puts "Creating new reservations"

8.times do
    today = Date.today

    #The start date is chosen at random between today and the next 4 days, the end date is chosen at random between today + 5 and 9 days.
    p new_reservation = Reservation.create(user_id:user_ids_list.sample(1)[0], costume_id: mascot_ids_list.sample(1)[0], status: %w(Pending Approved Rejected).sample(1)[0],
                                          start_date: today + rand(0..4), end_date: today + rand(5..9), message: Faker::Lorem.sentence(word_count: 3, supplemental: true) )

      if new_reservation.valid? == false
           puts new_reservation.errors.full_messages
     end
    new_reservation.save
end


# Use this code to return reason why object cannot be saved
# if new_user.valid? == false
#   puts new_user.errors.full_messages
# end
