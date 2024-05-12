class SetSequenceForShifts < ActiveRecord::Migration[7.0]
  def up
    execute("SELECT setval('shifts_id_seq', (SELECT MAX(id) FROM shifts));")

  end
end
