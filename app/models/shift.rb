class Shift < ApplicationRecord
  belongs_to :worker, foreign_key: 'user_id'
  before_validation :parse_start_date

  def parse_start_date
    self.start_date = Date.parse(start_date.to_s) unless start_date.nil?
  end
end
