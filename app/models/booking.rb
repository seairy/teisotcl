class Booking < ActiveRecord::Base
  belongs_to :participant
  belongs_to :room
  validates :room_id, :presence => true
end
