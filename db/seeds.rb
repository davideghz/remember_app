# Users
User.create!(email: "example@example.org",
             password: "12345678")

99.times do |n|
  name = User
  email = "example-#{n+1}@example.org"
  password = "12345678"
  User.create!(email: email,
               password: password)
end

# Vehicles
users = User.order(:created_at).take(6)
3.times do |n|
  users.each { |user| user.vehicles.create!(name: "car-#{n+1}", matriculation_date: rand(10.years).seconds.ago) }
end
