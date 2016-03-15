# Users
user = User.new(email: "davideghz@gmail.com",
                password: "12345678")
user.skip_confirmation! # it sets confirmed_at: DateTime.now
user.save!


5.times do |n|
  email = "example-#{n+1}@example.org"
  password = "12345678"
  user = User.new(email: email,
                  password: password)
  user.skip_confirmation!
  user.save!
end

# Seed the first 2 users with 3 vehicles each
users = User.order(:created_at).take(2)
3.times do |n|
  users.each { |user| user.vehicles.create!(name: "car-#{n+1}", matriculation_date: rand(10.years).seconds.ago) }
end

# Seed all vehicles with insurance
vehicles = Vehicle.all

  vehicles.each { |vehicle| vehicle.insurances.create!(name: "test insurance",
                                                        issue_date: rand(10.years).seconds.ago,
                                                        expiry_date: rand(10.years).seconds.ago)}