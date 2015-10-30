class Exercise < ActiveRecord::Base
  belongs_to :user

  validates :duration, numericality: { only_integer: true }
  validates :duration, presence: true
  validates :workout, presence: true
  validates :workout_date, presence: true
  validates :user_id, presence: true
end
