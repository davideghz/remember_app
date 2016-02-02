# Users
User.create!(email: "example@railstutorial.org",
             password: "12345678")

99.times do |n|
  name = User
  email = "example-#{n+1}@railstutorial.org"
  password = "12345678"
  User.create!(email: email,
               password: password)
end

# Vehicles
users = User.order(:created_at).take(6)
50.times do
  users.each { |user| user.vehicles.create!(name: "car", matriculation_date: "2015/01/01") }
end
