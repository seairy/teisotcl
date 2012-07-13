class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :participant, :null => false
      t.references :room, :null => false
      t.date :from, :to
      t.boolean :tour_museum, :tour_tw, :null => false
      t.text :remark
      t.timestamps
    end
  end
end
