desc "This task is called by the Heroku scheduler add-on"

task :send_reminders => :environment do
  puts "Sending reminder..."
  @users = User.all

  # todo: check directly insurances and send email to user(find_by: user_id)
  @users.each do |user|
    user.vehicles.each do |vehicle|
      if vehicle.insurance && vehicle.insurance.expiry_date == 1.month.from_now.to_date
        RandomEmail.send_random_email(user).deliver_now
        puts user.email
      end
    end
  end

end
