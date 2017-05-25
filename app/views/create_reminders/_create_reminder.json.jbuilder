json.extract! create_reminder, :id, :state, :date, :time, :datetime, :created_at, :updated_at
json.url create_reminder_url(create_reminder, format: :json)
