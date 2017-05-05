# Preview all emails at http://localhost:3000/rails/mailers/m_template
class MTemplatePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/m_template/useTemplate
  def useTemplate
    MTemplateMailer.useTemplate CreateReminders.new(email: 'usuario1@mail.com' templates_name: 'asd')
  end

end
