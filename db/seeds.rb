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

puts "Creating admin users"
    p admin = User.create(name: 'Andrii', email: 'andrii@gmail.com', password: 'password')
    admin.profile_picture.attach(io: URI.open("https://avatars.githubusercontent.com/u/16020290?s=96&v=4"), filename: "admin", content_type: "image/jpg")
    admin.save
    p admin2 = User.create(name: 'Mark', email: 'mark@gmail.com', password: 'password')
    admin2.profile_picture.attach(io: URI.open("https://avatars.githubusercontent.com/u/96311326?v=4"), filename: "admin", content_type: "image/jpg")
    admin2.save
    p admin3 = User.create(name: 'Suzanne', email: 'suzanne@gmail.com', password: 'password')
    admin3.profile_picture.attach(io: URI.open("https://avatars.githubusercontent.com/u/73802863?v=4"), filename: "admin", content_type: "image/jpg")
    admin3.save
    p admin4 = User.create(name: 'Jean-Francois', email: 'jf@gmail.com', password: 'password')
    admin4.profile_picture.attach(io: URI.open("https://avatars.githubusercontent.com/u/50388199?v=4"), filename: "admin", content_type: "image/jpg")
    admin4.save

# 15.times do
#     puts "Creating new users"
#      p new_user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8, max_length: 10))
#      new_user.profile_picture.attach(io: URI.open("https://etimg.etb2bimg.com/thumb/msid-89971365,imgsize-900486,width-1200,height-900,overlay-etbrandequity/louie-is-back-mortein-brings-back-brand-mascot-in-new-avatar.jpg"), filename: "admin", content_type: "image/jpg")
#      new_user.save
# end

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
                              chiitan.images.attach(io: URI.open("https://upload.wikimedia.org/wikipedia/commons/e/e2/Chiitan.jpg"), filename: "admin", content_type: "image/jpg")
    chiitan.save

    p pink_dragron = Costume.create(name: "Pink Dragon", descr: "Chinese style!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                                    size: %w(Small Medium Large).sample(1)[0], category:"Animal", user_id:  user_ids_list.sample(1)[0],
                                    image: "chiitan.jpg" )
                                    pink_dragron.images.attach(io: URI.open("https://ae01.alicdn.com/kf/HTB1WkXcIFXXXXbMXFXXq6xXFXXXU/Shanghai-Story-New-arrival-anime-The-wind-dancer-cosplay-costumes-Chinese-Girl-clothing-lolita-dress-2.jpg"), filename: "admin", content_type: "image/jpg")
    pink_dragron.save

    p football_fan = Costume.create(name: "Rowdy", descr: "For american football fans!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                                    size: %w(Small Medium Large).sample(1)[0], category:"Sports", user_id:  user_ids_list.sample(1)[0],
                                    image: "ford.jpg" )
                                    football_fan.images.attach(io: URI.open("https://i.pinimg.com/originals/6d/f6/cc/6df6cc00a780b186e396325e312c9d23.jpg"), filename: "admin", content_type: "image/jpg")
    football_fan.save
    p gritty = Costume.create(name: "Gritty", descr: "Nice, but a little crazy!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                                    size: %w(Small Medium Large).sample(1)[0], category:"Sports", user_id:  user_ids_list.sample(1)[0],
                                    image: "gritty.jpg"  )
                                    gritty.images.attach(io: URI.open("https://media.newyorker.com/photos/5bbd10430cdf452cf93ca22f/master/pass/Crouch-Gritty.jpg"), filename: "admin", content_type: "image/jpg")

    gritty.save
    p mickey = Costume.create(name: "Mickey", descr: "Perfect for your special day!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                              size: %w(Small Medium Large).sample(1)[0], category:"Wedding", user_id:  user_ids_list.sample(1)[0],
                              image: "mickey.jpg"  )
                              mickey.images.attach(io: URI.open("https://i.pinimg.com/originals/a3/06/fd/a306fdd1bdccc4205872a1e432a0cfc5.jpg"), filename: "admin", content_type: "image/jpg")

      mickey.save
    p panda = Costume.create(name: "Cool Panda", descr: "Great for birthday parties!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                              size: %w(Small Medium Large).sample(1)[0], category:"Wedding", user_id:  user_ids_list.sample(1)[0],
                              image: "panda.jpg"  )
                              panda.images.attach(io: URI.open("https://ae01.alicdn.com/kf/HTB19oTGdpGWBuNjy0Fbq6z4sXXaX/Panda-mascot-For-Advertising-3M-Tall-Customize-For-Adult-cartoon-character-mascots-for-sale-mascotte-costumes.jpg"), filename: "admin", content_type: "image/jpg")

      panda.save
    p unicorn = Costume.create(name: "Rainbow Dash", descr: "Perfect for tall people!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                              size: "Large", category:"Animal", user_id:  user_ids_list.sample(1)[0],
                              image: "unicorn.jpg"  )
                              unicorn.images.attach(io: URI.open("https://lovelygift4u.com/wp-content/uploads/2021/06/Lovelygift4u.com-mascot-1.jpeg"), filename: "admin", content_type: "image/jpg")

      unicorn.save
    p coffee = Costume.create(name: "Mr. Coffee", descr: "Show your &#10084;&#65039; for coffee!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                              size: %w(Small Medium Large).sample(1)[0], category:"Corporate", user_id:  user_ids_list.sample(1)[0],
                              image: "coffee_cup.jpg"  )
                              coffee.images.attach(io: URI.open("https://www.mascots-inc.com/wp-content/uploads/2020/07/Costa-Mascot.jpg"), filename: "admin", content_type: "image/jpg")

      if !coffee.valid?
        puts coffee.errors.full_messages
      end
      coffee.save
    p lobster = Costume.create(name: "Sophie the lobster", descr: "Who doesn't like lobsters?!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                              size: %w(Small Medium Large).sample(1)[0], category:"Animal", user_id:  user_ids_list.sample(1)[0],
                              image: "panda.jpg"  )
                              lobster.images.attach(io: URI.open("https://www.stuffedanimals.com/v/vspfiles/photos/MU47413-2.jpg?v-cache=1633952963"), filename: "admin", content_type: "image/jpg")

      lobster.save
      p youpi = Costume.create(name: "Youpi!", descr: "Everyone's favourite!", address: MTL_ADDRESSES.sample(1)[0], price: rand(30..100),
                                size: %w(Small Medium Large).sample(1)[0], category:"Corporate", user_id:  user_ids_list.sample(1)[0],
                                image: "youpi.jpg"  )
                                youpi.images.attach(io: URI.open("https://s.yimg.com/os/en/blogs/sptusmlbexperts/youppi050212.jpg"), filename: "admin", content_type: "image/jpg")

      youpi.save


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
