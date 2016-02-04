# Preview all emails at http://localhost:3000/rails/mailers/random_email
class RandomEmailPreview < ActionMailer::Preview
  def random_email_preview
    RandomEmail.send_random_email(User.first)
  end

end
