class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: :creator_id
    has_many :attendances
    has_many :attendees, through: :attendances, source: :user

    validates :name, presence: true
    validates :description, presence: true
    validates :date, presence: true
    validates :location, presence: true
end
