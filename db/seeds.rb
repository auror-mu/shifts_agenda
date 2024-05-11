require 'json'
require 'date'

Worker.destroy_all
Shift.destroy_all

data = File.read(Rails.root.join('db', 'data.json'))

parsed_data = JSON.parse(data)

parsed_data['workers'].each do |worker|
  Worker.create!(worker)
end

parsed_data['shifts'].each do |shift|
  shift.delete('planning_id')
  worker = Worker.find_by(id: shift['user_id']) # after error while deploying on heroku

  if worker.present?
    Shift.create!(shift.merge(worker: worker))
  else
    puts "Worker with ID #{shift['user_id']} not found."
  end
end
