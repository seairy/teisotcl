class Room < ActiveRecord::Base
  belongs_to :hotel
  has_many :bookings
  
  def full?
    bookings.count >= quota * bed_amount
  end
end
