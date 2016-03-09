desc "This task is called by the Heroku scheduler add-on"

task :send_reminders => :environment do
  puts "Sending reminder..."
  @users = User.all

  @users.each do |user|
    #user.send_email
    RandomEmail.send_random_email(user).deliver_now
    puts user.email
  end

end