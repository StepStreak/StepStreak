# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(email: 'test@test.com', username: 'test', password: '1234', password_confirmation: '1234')

2.years.ago.to_date.upto(Date.current.end_of_year) do |date|
  Activity.create(steps: Faker::Number.between(from: 1000, to: 10000),
                  distance: Faker::Number.between(from: 1000, to: 10000),
                  calories: Faker::Number.between(from: 115, to: 500),
                  heart_rate: Faker::Number.between(from: 80, to: 130),
                  date: date,
                  user: user)
end