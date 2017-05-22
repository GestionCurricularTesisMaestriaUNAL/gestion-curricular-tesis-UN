class CreateReminder < ApplicationRecord

  def self.reminder_date()
    joins(:roles).select("create_reminders.date")
  end

  def self.reminder_time()
    joins(:roles).select("create_reminders.time")
  end
end
