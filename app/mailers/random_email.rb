class RandomEmail < ApplicationMailer

  # send the user a random email
  def send_random_email(user)
    @user = user
    mail( :to => @user.email,
          :subject => 'This is a random email' )
  end

end
