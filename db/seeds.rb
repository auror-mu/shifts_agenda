# db/seeds.rb

require 'json'
Worker.destroy_all

data = File.read(Rails.root.join('db', 'data.json'))

parsed_data = JSON.parse(data)

parsed_data['workers'].each do |worker|
  Worker.create!(worker)
end

parsed_data['shifts'].each do |shift|
  shift.delete('planning_id')
  Shift.create!(shift)
end
