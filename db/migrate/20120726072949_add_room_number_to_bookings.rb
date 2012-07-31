class AddRoomNumberToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :room_number, :string, :limit => 50, :after => :room_id
  end
end
