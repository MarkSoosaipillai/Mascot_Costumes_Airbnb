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
     p new_user = User.new(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8, max_length: 10))
     new_user.save
end

#Retrieving the list of all user ids
p user_ids_list = User.all.pluck(:id)


puts "Creating new costumes"
imageArray = ["chiitan.jpg", "ford.jpg", "gritty.jpg", "mickey.jpg", "unicorn.jpg"]
10.times do
    p new_costume =  Costume.new(name: ["Chiitan", "Gritty", "Youpi!", "Mickey", "Rainbow Dash"].sample(1)[0], descr: Faker::Lorem.sentence(word_count: 10, supplemental: true), price: rand(30..100),
                                  size: %w(Small Medium Large).sample(1)[0], category: %w(Corporate Animal Sports Cartoon Wedding).sample(1)[0], user_id:  user_ids_list.sample(1)[0],
                                  image:imageArray.sample(1)[0])
    new_costume.save
end

#Retrieving the list of all mascot ids
p mascot_ids_list = Costume.all.pluck(:id)

puts "Creating new reservations"

8.times do
    today = Date.today

    #The start date is chosen at random between today and the next 4 days, the end date is chosen at random between today + 5 and 9 days.
    p new_reservation = Reservation.new(user_id:user_ids_list.sample(1)[0], costume_id: mascot_ids_list.sample(1)[0], status: %w(Pending Approved Rejected).sample(1)[0],
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
