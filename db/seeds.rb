# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin.create(email: 'admin@test', password: '1234', password_confirmation: '1234')

AppConfig.create(app: :ios, version: '1.3')
AppConfig.create(app: :android, version: '1.3')

1.upto(10).each do |i|
  User.create(email: "user#{i}@test",
              username: "user#{i}",
              password: '1234',
              password_confirmation: '1234')
end

User.all.each do |user|
  1.year.ago.to_date.upto(Date.current) do |date|
    Activity.create(steps: Faker::Number.between(from: 1000, to: 10000),
                    distance: Faker::Number.between(from: 1000, to: 10000),
                    calories: Faker::Number.between(from: 115, to: 500),
                    heart_rate: Faker::Number.between(from: 80, to: 130),
                    date: date,
                    user: user)
  end
end

Challenge.create(title: Faker::Lorem.sentence(word_count: 3),
                 challenge_type: :solo,
                 mode: :race,
                 starts_at: Date.current.beginning_of_week,
                 ends_at: Date.current.beginning_of_week + 1.week)

User.all.each do |user|
  ChallengeUser.create(user: user, challenge: Challenge.first)
end

Challenge.create title: Faker::Lorem.sentence(word_count: 3),
                  challenge_type: :team,
                  mode: :race,
                  starts_at: Date.current.beginning_of_week,
                  ends_at: Date.current.beginning_of_week + 1.week

Tournament.create name: 'Tournament 1',
                  code: 'code',
                  start_date: Date.current - 1.day,
                  end_date: Date.current + 1.week

Challenge.create title: 'Solo',
                 challenge_type: :solo,
                 mode: :race,
                 starts_at: Date.current - 1.day,
                 ends_at: Date.current,
                 tournament: Tournament.first


Challenge.create title: 'King of the hill',
                 challenge_type: :solo,
                 mode: :king_of_the_hill,
                 starts_at: Date.current,
                 ends_at: Date.current + 1.days,
                 tournament: Tournament.first

Challenge.create title: 'Milestone',
                 challenge_type: :solo,
                 mode: :milestone,
                 goal: 25000,
                 starts_at: Date.current + 1.days,
                 ends_at: Date.current + 2.days,
                 tournament: Tournament.first

User.all.each do |user|
  TournamentParticipant.create(user: user, tournament: Tournament.first)
end

# app = Rpush::Apns2::App.new
# app.name = "ios_app"
# app.certificate = File.read("production.pem")
# app.environment = "production"
# app.bundle_id = "com.stepstreak.dev"
# app.connections = 1
# app.save!

# app = Rpush::Gcm::App.new
# app.name = "android_app"
# app.auth_key = 'server_key'
# app.connections = 1
# app.save!