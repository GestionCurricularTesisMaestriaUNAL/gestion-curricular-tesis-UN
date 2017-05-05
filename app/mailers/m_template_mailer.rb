class MTemplateMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.m_template_mailer.useTemplate.subject
  #
  def useTemplate(user, templates_name)
  #S  @mail_templates = mail_templates
    @user = user
    @templates_name = templates_name

    mail to: user, subject: templates_name.name
  end
end
