class Worker < ApplicationRecord
  validates :id, uniqueness: true
  
  has_many :shifts
end
