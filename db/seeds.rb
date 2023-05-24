# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do
  flat = Flat.create(
    name: Faker::Name.first_name,
    address: Faker::Address.city,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price_per_night: Faker::Number.between(from: 70, to: 200),
    number_of_guests: Faker::Number.between(from: 1, to: 5),
    picture_url: 'https://loremflickr.com/#{rand(150..200)}/#{rand(150..200)/all}'
  )
end
