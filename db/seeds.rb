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
#      p admin = User.create(name: 'Andrii', email: 'andrii@gmail.com', password: 'password')
#      p new_user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8, max_length: 10))
#      admin.save
#      new_user.save
# end


#Retrieving the list of all user ids, excluded J-F from the list as we will be using his ID for the demo and we do not want him to own costumes or to have reservations before the demo.
p user_ids_list = User.all.where.not(name:"Jean-Francois").pluck(:id)

puts "Creating new costumes"

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
    '5240 Randall Av, Montreal QC',
    '3555 Edouard-Montpetit, Montreal QC',
    '12225 Av de Saint-Castin, Montreal QC',
    '391 Rue de la Congrégation, Montreal QC',
    '5333 Avenue Casgrain, Montreal QC'
]

p chiitan = Costume.create(name: "Chiitan",
                          descr: "Mischievous japanese mascot!",
                          address: MTL_ADDRESSES[0],
                          price: rand(30..100),
                          size: %w(Small Medium Large).sample(1)[0],
                          category:"Cartoon",
                          user_id:  user_ids_list.sample(1)[0]
                          )
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652065061/development/chiitan.jpg')
chiitan.images.attach(io: file, filename: 'chiitan.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652277011/production/chiitan_3_kxzq1l.jpg')
chiitan.images.attach(io: file, filename: 'chiitan.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652277011/production/chiitan_2_cmtsmt.jpg')
chiitan.images.attach(io: file, filename: 'chiitan.jpg', content_type: 'image/jpg')
chiitan.save

p pink_dragon = Costume.create(name: "Pink Dragon",
                              descr: "Chinese style!",
                              address: MTL_ADDRESSES[1],
                              price: rand(30..100),
                              size: %w(Small Medium Large).sample(1)[0],
                              category:"Animal",
                              user_id:  user_ids_list.sample(1)[0]
                              )
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275239/development/chinese_costume.jpg')
pink_dragon.images.attach(io: file, filename: 'pink_dragon.jpg', content_type: 'image/jpg')
pink_dragon.save

p football_fan = Costume.create(name: "Rowdy",
                                descr: "For american football fans!",
                                address: MTL_ADDRESSES[2],
                                price: rand(30..100),
                                size: %w(Small Medium Large).sample(1)[0],
                                category:"Sports",
                                user_id:  user_ids_list.sample(1)[0]
                              )
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275241/development/rowdy.jpg')
football_fan.images.attach(io: file, filename: 'football_fan.jpg', content_type: 'image/jpg')
football_fan.save

p gritty = Costume.create(name: "Gritty",
                          descr: "Nice, but a little crazy!",
                          address: MTL_ADDRESSES[3],
                          price: rand(30..100),
                          size:%w(Small Medium Large).sample(1)[0],
                          category:"Sports",
                          user_id:  user_ids_list.sample(1)[0]
                        )
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275241/development/gritty.jpg')
gritty.images.attach(io: file, filename: 'gritty.png', content_type: 'image/png')
gritty.save

p mickey = Costume.create(name: "Mickey",
                          descr: "Perfect match ❤️ with Minnie!",
                          address: MTL_ADDRESSES[4],
                          price: rand(30..100),
                          size: %w(Small Medium Large).sample(1)[0],
                          category:"Wedding",
                          user_id:  user_ids_list.sample(1)[0]
                         )
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275242/development/mickey1.jpg')
mickey.images.attach(io: file, filename: 'mickey.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275242/development/mickey_3_erjre3.jpg')
mickey.images.attach(io: file, filename: 'mickey.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275239/development/mickey_dkdzjw.jpg')
mickey.images.attach(io: file, filename: 'mickey.png', content_type: 'image/png')
mickey.save

p panda = Costume.create(name: "Cool Panda",
                        descr: "Great for birthday parties!",
                        address: MTL_ADDRESSES[5],
                        price: rand(30..100),
                        size: %w(Small Medium Large).sample(1)[0],
                        category:"Wedding",
                        user_id: user_ids_list.sample(1)[0]
                       )
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275239/development/panda.jpg')
panda.images.attach(io: file, filename: 'panda.png', content_type: 'image/png')
panda.save

p unicorn = Costume.create(name: "Rainbow Dash",
                          descr: "Perfect for tall people!",
                          address: MTL_ADDRESSES[6],
                          price: rand(30..100),
                          size: "Large",
                          category:"Animal",
                          user_id: user_ids_list.sample(1)[0]
                          )
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275240/development/unicorn.jpg')
unicorn.images.attach(io: file, filename: 'unicorn.png', content_type: 'image/png')
unicorn.save

p coffee = Costume.create(name: "Mr. Coffee",
                          descr: "Show your love for coffee! ☕",
                          address: MTL_ADDRESSES[7],
                          price: rand(30..100),
                          size: %w(Small Medium Large).sample(1)[0],
                          category:"Corporate",
                          user_id:  user_ids_list.sample(1)[0]
                        )
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275240/development/coffee_cup.jpg')
coffee.images.attach(io: file, filename: 'coffee.png', content_type: 'image/png')
coffee.save

p lobster = Costume.create(name: "Sophie the lobster",
                          descr: "Who doesn't like lobsters?!",
                          address: MTL_ADDRESSES[8],
                          price: rand(30..100),
                          size: %w(Small Medium Large).sample(1)[0],
                          category:"Animal",
                          user_id:  user_ids_list.sample(1)[0]
                        )
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275241/development/lobster.jpg')
lobster.images.attach(io: file, filename: 'lobster.png', content_type: 'image/png')
lobster.save

p youpi = Costume.create(name: "Youpi!",
                        descr: "Everyone's favourite!",
                        address: MTL_ADDRESSES[9],
                        price: rand(30..100),
                        size: %w(Small Medium Large).sample(1)[0],
                        category:"Corporate",
                        user_id:  user_ids_list.sample(1)[0]
                        )
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652135154/development/youpi.jpg')
youpi.images.attach(io: file, filename: 'youpi.png', content_type: 'image/png')
youpi.save

p pikachu = Costume.create(name: "Pikachu!",
  descr: "Because yellow is the new black and batch #790 loves Pokemon",
  address: MTL_ADDRESSES[13],
  price: rand(30..100),
  size: %w(Small Medium Large).sample(1)[0],
  category:"Cartoon",
  user_id:  user_ids_list.sample(1)[0]
  )
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275239/development/pokemon_3_ixsztg.jpg')
pikachu.images.attach(io: file, filename: 'pikachu2.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275240/development/pokemon_costume_mskcha.jpg')
pikachu.images.attach(io: file, filename: 'pikachu1.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275239/development/pokemon_2_v2p4uu.jpg')
pikachu.images.attach(io: file, filename: 'pikachu3.png', content_type: 'image/png')
pikachu.save

p pinguin = Costume.create(name: "Pinguin!",
  descr: "Perfect for the Canadian winter",
  address: " 5170 Boul. Saint-Laurent, Montreal QC",
  price: rand(30..100),
  size: %w(Small Medium Large).sample(1)[0],
  category:"Animal",
  user_id:  user_ids_list.sample(1)[0]
  )
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275239/development/pinguin_k4ifq9.jpg')
pinguin.images.attach(io: file, filename: 'pinguin.png', content_type: 'image/png')
pinguin.save

p minnie = Costume.create(name: "Minnie",
  descr: "Perfect match ❤️ with Mickey mouse!",
  address: MTL_ADDRESSES[4],
  price: rand(30..100),
  size: %w(Small Medium Large).sample(1)[0],
  category:"Wedding",
  user_id:  user_ids_list.sample(1)[0]
 )
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275239/development/minnie_ek8sdb.jpg')
minnie.images.attach(io: file, filename: 'minnie.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1652275239/development/minnie_2_bm19yv.jpg')
minnie.images.attach(io: file, filename: 'minnie.png', content_type: 'image/png')
minnie.save


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
