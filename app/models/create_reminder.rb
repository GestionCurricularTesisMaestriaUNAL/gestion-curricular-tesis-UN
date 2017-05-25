class CreateReminder < ApplicationRecord


  validates :date, :gradework, :mail_template, presence: true

  belongs_to :gradework
  belongs_to :mail_template


  def self.mail

    self.all.each do |remind|

      if (remind.date == Date.today)


        remind.gradework.users.each do |user|

          if(user.role.name = "Jury" and remind.jury)
            MTemplateMailer.notify(user, self.mail_template).deliver_later!
          end

          if(user.role.name = "Student" and remind.student)
            MTemplateMailer.notify(user, self.mail_template).deliver_later!
          end

          if(user.role.name = "Director" and remind.director)
            MTemplateMailer.notify(user, self.mail_template).deliver_later!
          end

          end

      end
    end
  end


  def self.reminder_date()
    joins(:roles).select("create_reminders.date")
  end

  def self.reminder_time()
    joins(:roles).select("create_reminders.time")
  end
end
