# Preview all emails at http://localhost:3000/rails/mailers/welcome
class WelcomePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/welcome/notify
  def notify
    WelcomeMailer.notify User.new(firstname: 'Usuario1', email: 'usuario1@mail.com')
  end

end
