class CreateCreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :create_reminders do |t|
      t.string :state
      t.date :date
      t.time :time
      t.datetime :datetime

      t.timestamps
    end
  end
end
