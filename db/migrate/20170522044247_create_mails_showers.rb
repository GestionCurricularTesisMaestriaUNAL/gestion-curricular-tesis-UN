class CreateMailsShowers < ActiveRecord::Migration[5.0]
  def change
    create_table :mails_showers do |t|

      t.timestamps
    end
  end
end
