require 'json'
require 'date'

# Clear existing data
Worker.destroy_all
Shift.destroy_all
data = File.read(Rails.root.join('db', 'data.json'))
parsed_data = JSON.parse(data)

parsed_data['workers'].each do |worker_data|
  Worker.create!(worker_data)
end

parsed_data['shifts'].each do |shift_data|
  shift_data.delete('planning_id')

  worker = Worker.find_by(id: shift_data['user_id'])

  if worker.present?
    Shift.create!(shift_data.merge(worker: worker))
  else
    puts "Worker with ID #{shift_data['user_id']} not found."
  end
end
