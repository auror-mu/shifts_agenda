class AddForeignKeyToShifts < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :shifts, :workers, column: :user_id
  end
end
