class Activity < ApplicationRecord
  validates :date, :steps, :calories, :heart_rate, :resting_heart_rate, presence: true
  validates :date, uniqueness: true
end
