class Booking < ActiveRecord::Base
  belongs_to :participant
  belongs_to :room
  scope :tour_museum, where('tour_museum = 1')
  scope :tour_tw, where('tour_tw = 1')
  scope :registered, includes(:participant).where('participants.registered_at IS NOT NULL')
  scope :unregister, includes(:participant).where('participants.registered_at IS NULL')
  validates :room_id, :presence => true
end
