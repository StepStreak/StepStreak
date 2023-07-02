class Activity < ApplicationRecord
  validates :date, :steps, :calories, presence: true
  validates :date, uniqueness: true
end
