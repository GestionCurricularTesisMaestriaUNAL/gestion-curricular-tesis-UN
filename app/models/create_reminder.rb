class CreateReminder < ApplicationRecord


  belongs_to :gradework
  belongs_to :mail_template

  def self.reminder_date()
    joins(:roles).select("create_reminders.date")
  end

  def self.reminder_time()
    joins(:roles).select("create_reminders.time")
  end
end
