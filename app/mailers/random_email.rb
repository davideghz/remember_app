class RandomEmail < ApplicationMailer

  # send the user a random email
  def send_random_email(user)
    @user = user

    I18n.with_locale(@user.locale) do
      mail( :to => @user.email )
    end

  end

end
