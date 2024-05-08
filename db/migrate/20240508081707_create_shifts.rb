class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.integer :user_id
      t.date :start_date

      t.timestamps
    end
  end
end
