class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.integer :identification
      t.integer :phone

      t.timestamps
    end
  end
end
