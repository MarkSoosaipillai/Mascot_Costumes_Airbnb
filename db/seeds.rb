# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning up database..."
Costume.destroy_all
puts "Database cleaned"

10.times do |i|
    puts "Creating Costumes....#{i+1}"
    user = User.create(
        name: "Andrii",
        email: "andrii@gmail.com",
        password: "password"
    )
    costume = Costume.create(
        name: "Barney Costume",
        descr: "Nice costume for the best parties",
        price: 29.99,
        size: "small",
        category: "Corporate",
        user_id: 1,
      )
end
puts "Costumes created"
