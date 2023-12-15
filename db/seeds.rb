# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(email: 'test1@test.com', username: 'test1', password: '1234', password_confirmation: '1234')
User.create(email: 'test2@test.com', username: 'test2', password: '1234', password_confirmation: '1234')

1.year.ago.to_date.upto(Date.current) do |date|
  Activity.create(steps: Faker::Number.between(from: 1000, to: 10000),
                  distance: Faker::Number.between(from: 1000, to: 10000),
                  calories: Faker::Number.between(from: 115, to: 500),
                  heart_rate: Faker::Number.between(from: 80, to: 130),
                  date: date,
                  user: user1)
end

Challenge.create(title: Faker::Lorem.sentence(word_count: 3),
                 challenge_type: :solo,
                 starts_at: Date.current.beginning_of_week,
                 ends_at: Date.current.beginning_of_week + 1.week)

User.all.each do |user|
  ChallengeUser.create(user: user, challenge: Challenge.first)
end

# app = Rpush::Apns2::App.new
# app.name = "ios_app"
# app.certificate = File.read("production.pem")
# app.environment = "production"
# app.bundle_id = "com.stepstreak.dev"
# app.connections = 1
# app.save!