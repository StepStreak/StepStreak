class Activity < ApplicationRecord
  belongs_to :user

  validates :date, :steps, :calories, :heart_rate, :resting_heart_rate, :max_heart_rate, presence: true
end
