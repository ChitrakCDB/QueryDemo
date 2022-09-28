# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
7.times do
  Director.create(director_name: Faker::Sports::Football.player)
  Producer.create(producer_name: Faker::Sports::Football.coach)
end
dids = Director.all.ids
proids = Producer.all.ids
100.times do
  Movie.create(title: Faker::Movie.title, release: Faker::Date.in_date_period,
               rating: Faker::Number.between(from: 1, to: 5), director_id: rand(dids.last), producer_id: rand(proids.last))
end
