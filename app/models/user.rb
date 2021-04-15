class User < ApplicationRecord
  has_many :events, foreign_key: :creator, class_name: 'Event'
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  validates :name, presence: true, uniqueness: true
end
